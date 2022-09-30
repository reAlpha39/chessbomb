import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart';
import 'package:flutter/foundation.dart';
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
  Animation<Color?>? animationPlayerPion;
  Animation<Color?>? animationSelectableMovement;
  AnimationController? controller;

  @override
  initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller!, curve: Curves.ease);

    animationPlayerPion =
        ColorTween(begin: Colors.black, end: Colors.red).animate(curve);
    animationSelectableMovement =
        ColorTween(begin: Colors.black, end: Colors.blue).animate(curve);

    animationPlayerPion!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller!.forward();
      }
      setState(() {});
    });
    animationSelectableMovement!.addStatusListener((status) {
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
      animation:
          context.read<GameBoardCubit>().playerPion.contains(widget.index)
              ? animationPlayerPion!
              : animationSelectableMovement!,
      builder: (context, child) {
        return BlocBuilder<GameBoardCubit, GameBoardState>(
          builder: (context, state) {
            return InkWell(
              onTap: () => state.maybeWhen(
                selectedStrategy: () => context.read<GameBoardCubit>()
                  ..selectTile(widget.index)
                  ..pickTileDest(),
                selectedSkill: () => context.read<GameBoardCubit>()
                  ..selectTile(widget.index)
                  ..activateSkill(),
                orElse: () => context.read<GameBoardCubit>()
                  ..selectTile(widget.index)
                  ..pickPion(),
              ),
              child: _TileLayout(
                index: widget.index,
                animationPlayerPion: animationPlayerPion,
                animationSelectableMovement: animationSelectableMovement,
              ),
            );
          },
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

class _TileLayout extends StatelessWidget {
  final int index;
  final Animation<Color?>? animationPlayerPion;
  final Animation<Color?>? animationSelectableMovement;
  const _TileLayout({
    Key? key,
    required this.index,
    this.animationPlayerPion,
    this.animationSelectableMovement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child:
                kDebugMode ? index.text.lg.make().centered() : const SizedBox())
        .height(5)
        .width(5)
        .color(context.read<GameBoardCubit>().boardState(index))
        .border(
          color: context.read<GameBoardCubit>().selectedTiles == index
              ? Colors.green
              : BlocProvider.of<GameBoardCubit>(context).state.maybeWhen(
                    selectedStrategy: () =>
                        context.read<GameBoardCubit>().movement.contains(index)
                            ? animationSelectableMovement!.value!
                            : Colors.black,
                    orElse: () => context
                            .read<GameBoardCubit>()
                            .playerPion
                            .contains(index)
                        ? animationPlayerPion!.value!
                        : Colors.black,
                  ),
          width: 2,
        )
        .make();
  }
}
