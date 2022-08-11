import 'package:bombernyaa/app/game/bloc/turn_timer/turn_timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class TurnTimer extends StatelessWidget {
  const TurnTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TurnTimerCubit, TurnTimerState>(
      builder: (context, state) {
        return (context.read<TurnTimerCubit>().time.toString() + 's')
            .text
            .bold
            .size(32)
            .makeCentered()
            .pOnly(bottom: 12);
      },
    );
  }
}
