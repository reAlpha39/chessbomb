import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart';
import 'package:bombernyaa/app/game/bloc/poin_counter/poin_counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerPoint extends StatelessWidget {
  const PlayerPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PoinCounterCubit, PoinCounterState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BlocBuilder<GameBoardCubit, GameBoardState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  context.read<GameBoardCubit>().playerId == '1'
                                      ? Colors.green
                                      : Colors.red,
                            ),
                            height: 15,
                            width: 15,
                          ),
                          const SizedBox(width: 8),
                          const Text("Player 1"),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  context.read<PoinCounterCubit>().playerAPoint.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    ":",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  context.read<PoinCounterCubit>().playerBPoint.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BlocBuilder<GameBoardCubit, GameBoardState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          const Text("Player 2"),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  context.read<GameBoardCubit>().playerId == '2'
                                      ? Colors.green
                                      : Colors.red,
                            ),
                            height: 15,
                            width: 15,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
