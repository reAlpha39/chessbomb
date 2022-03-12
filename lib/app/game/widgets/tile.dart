import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart';
import 'package:bombernyaa/app/game/bloc/player/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class Tile extends StatefulWidget {
  final int index;
  const Tile({Key? key, required this.index}) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> with SingleTickerProviderStateMixin {
  Animation<Color?>? animation;
  AnimationController? controller;

  @override
  initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller!, curve: Curves.ease);

    animation = ColorTween(begin: Colors.black, end: Colors.red).animate(curve);

    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller!.forward();
      }
      setState(() {});
    });
    controller!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, child) {
        return InkWell(
          onTap: () {
            if ([0, 1].contains(context.read<PlayerCubit>().playerStateIndex)) {
              context.read<GameBoardCubit>().selectTile(widget.index);
            }
          },
          child: VxBox(child: widget.index.text.lg.make().centered())
              .height(5)
              .width(5)
              .color(context.read<GameBoardCubit>().boardState(widget.index))
              .border(
                color:
                    context.read<GameBoardCubit>().selectedTiles == widget.index
                        ? Colors.green
                        : Colors.black,
                width: 2,
              )
              .make(),
        );
      },
    );
  }

  @override
  dispose() {
    controller?.dispose();
    super.dispose();
  }
}
