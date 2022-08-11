import 'package:bombernyaa/app/game/bloc/game_timer/game_timer_cubit.dart';
import 'package:bombernyaa/app/game/bloc/turn_timer/turn_timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class GameTimer extends StatelessWidget {
  const GameTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitTimer = context.read<GameTimerCubit>();
    return BlocBuilder<TurnTimerCubit, TurnTimerState>(
      builder: (context, state) {
        return (((cubitTimer.time / 60)
                            .truncate()
                            .toString()
                            .split("")
                            .length ==
                        2
                    ? (cubitTimer.time / 60).truncate().toString()
                    : "0" + (cubitTimer.time / 60).truncate().toString()) +
                ":" +
                ((cubitTimer.time % 60).toString().split("").length == 2
                    ? (cubitTimer.time % 60).toString()
                    : "0" + (cubitTimer.time % 60).toString()))
            .text
            .bold
            .size(32)
            .makeCentered()
            .pOnly(bottom: 12);
      },
    );
  }
}
