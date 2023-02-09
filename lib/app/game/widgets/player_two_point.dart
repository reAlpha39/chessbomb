import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/game_board/game_board_cubit.dart';
import '../bloc/poin_counter/poin_counter_cubit.dart';

class PlayerTwoPoint extends StatelessWidget {
  const PlayerTwoPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              const Text(
                'PLAYER 2',
                style: TextStyle(
                  color: Color(0xFFE5EA12),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ).p8(),
              Container(
                height: 5,
                width: 30,
                color: context.read<GameBoardCubit>().playerId == '2'
                    ? Colors.green
                    : Colors.red,
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Color(0xFF193D4F)),
              child: Text(
                context
                            .read<PoinCounterCubit>()
                            .playerBPoint
                            .toString()
                            .length ==
                        1
                    ? '0'
                    : context
                        .read<PoinCounterCubit>()
                        .playerBPoint
                        .toString()[0],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 30,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Color(0xFF193D4F)),
              child: Text(
                context
                            .read<PoinCounterCubit>()
                            .playerBPoint
                            .toString()
                            .length ==
                        1
                    ? context
                        .read<PoinCounterCubit>()
                        .playerBPoint
                        .toString()[0]
                    : context
                        .read<PoinCounterCubit>()
                        .playerBPoint
                        .toString()[1],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
