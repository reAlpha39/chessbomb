import 'package:bombernyaa/app/game/widgets/player_one_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/poin_counter/poin_counter_cubit.dart';
import 'game_timer.dart';
import 'player_point.dart';
import 'player_two_point.dart';
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
              // const PlayerPoint(),
              const SizedBox(width: double.infinity),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const PlayerOnePoint(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF224E65),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            'WAKTU PERMAINAN'
                                .text
                                .bold
                                .size(10)
                                .color(const Color(0xFFE5EA12))
                                .make(),
                            const RepaintBoundary(child: GameTimer()),
                          ],
                        ).p8(),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF224E65),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            'WAKTU GILIRAN'
                                .text
                                .bold
                                .size(10)
                                .color(const Color(0xFFE5EA12))
                                .make(),
                            const RepaintBoundary(child: TurnTimer()),
                          ],
                        ).p8(),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  const PlayerTwoPoint(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
