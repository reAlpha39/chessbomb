import 'package:bombernyaa/app/game/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 70,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemBuilder: (context, index) => Tile(
        index: index,
      ),
    ).box.border(color: Colors.black, width: 2).make();
  }
}
