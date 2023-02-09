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
        ColorTween(begin: Colors.black, end: const Color(0xFF00FF38))
            .animate(curve);
    animationSelectableMovement =
        ColorTween(begin: Colors.black, end: const Color(0xFF00FF38))
            .animate(curve);

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
      child: kDebugMode
          ? context.read<GameBoardCubit>().boardState(index) == ''
              ? const SizedBox()
              : Image.asset(
                  context.read<GameBoardCubit>().boardState(index),
                )
          : context.read<GameBoardCubit>().boardState(index) == ''
              ? const SizedBox()
              : Image.asset(
                  context.read<GameBoardCubit>().boardState(index),
                ),
    )
        .height(5)
        .width(5)
        .color(const Color(0xFFD3BB8D))
        .border(
          color: context.read<GameBoardCubit>().selectedTiles == index
              ? Colors.white
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
