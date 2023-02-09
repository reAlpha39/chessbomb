import 'package:bombernyaa/app/game/bloc/turn_timer/turn_timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TurnTimer extends StatelessWidget {
  const TurnTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TurnTimerCubit, TurnTimerState>(
      builder: (context, state) {
        final cubitTimer = context.read<TurnTimerCubit>();
        String time = (cubitTimer.time % 60).toString().split("").length == 2
            ? (cubitTimer.time % 60).toString()
            : "0" + (cubitTimer.time % 60).toString();
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Color(0xFF193D4F)),
              child: Text(
                time[0],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 25,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Color(0xFF193D4F)),
              child: Text(
                time[1],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
