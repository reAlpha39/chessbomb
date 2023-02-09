import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'game_timer.dart';
import 'player_point.dart';
import 'turn_timer.dart';

class GameDashboard extends StatelessWidget {
  const GameDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const ShapeBorderClipper(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD3B14D),
          border: Border.all(
            color: const Color(0xFFD3B14D),
            width: 6,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF9F6421),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const PlayerPoint(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      'Sisa waktu permainan'.text.base.make(),
                      const RepaintBoundary(child: GameTimer()),
                    ],
                  ).px12(),
                  Column(
                    children: [
                      'Sisa waktu giliran'.text.base.make(),
                      const RepaintBoundary(child: TurnTimer()),
                    ],
                  ).px12(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}