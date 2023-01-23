import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart';
import 'package:bombernyaa/app/game/bloc/game_timer/game_timer_cubit.dart';
import 'package:bombernyaa/app/game/bloc/poin_counter/poin_counter_cubit.dart';
import 'package:bombernyaa/app/game/bloc/roll_dice/roll_dice_cubit.dart';
import 'package:bombernyaa/app/game/bloc/turn_timer/turn_timer_cubit.dart';
import 'package:bombernyaa/app/game/widgets/game_board.dart';
import 'package:bombernyaa/app/game/widgets/game_timer.dart';
import 'package:bombernyaa/app/game/widgets/player_point.dart';
import 'package:bombernyaa/app/game/widgets/turn_timer.dart';
import 'package:bombernyaa/injection.dart';
import 'package:bombernyaa/presentation/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    Key? key,
    this.debugModeAddPoint = false,
    this.debugModeWinConditionA = false,
    this.debugModeWinConditionB = false,
    this.debugModeWinConditionC = false,
  }) : super(key: key);

  final bool debugModeAddPoint;
  final bool debugModeWinConditionA;
  final bool debugModeWinConditionB;
  final bool debugModeWinConditionC;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GameBoardCubit>()
            ..createBoardIndex(
              debugModelA: debugModeWinConditionA,
              debugModelB: debugModeWinConditionB,
            ),
        ),
        BlocProvider(
          create: (context) => getIt<RollDiceCubit>(),
        ),
        BlocProvider(
          create: (context) {
            if (debugModeAddPoint) {
              return getIt<PoinCounterCubit>()..addPoint();
            } else {
              return getIt<PoinCounterCubit>();
            }
          },
        ),
        BlocProvider(
          create: (context) {
            if (debugModeWinConditionC) {
              return getIt<GameTimerCubit>()
                ..setDebugTimer()
                ..startTimer();
            } else {
              return getIt<GameTimerCubit>()..startTimer();
            }
          },
        ),
        BlocProvider(
          create: (context) => getIt<TurnTimerCubit>()..startTimer(),
        ),
      ],
      child: WillPopScope(
        child: _GameLayout(
            setCustomRoll: debugModeWinConditionA
                ? true
                : debugModeWinConditionB
                    ? true
                    : false),
        onWillPop: () async => Dialogs.showGameSessionForceEndDialog(context),
      ),
    );
  }
}

class _GameLayout extends StatelessWidget {
  final bool setCustomRoll;
  const _GameLayout({Key? key, this.setCustomRoll = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GameTimerCubit, GameTimerState>(
          listener: (context, state) => state.maybeWhen(
            timeOut: () => context.read<GameBoardCubit>().forceEndGame(),
            orElse: () => null,
          ),
        ),
        BlocListener<RollDiceCubit, RollDiceState>(
          listener: (context, state) => state.maybeWhen(
            rolled: (index) {
              Dialogs.showRandomNumber(
                context: context,
                title: 'Your Number',
                middleText: index.toString(),
              );
              context.read<GameBoardCubit>()
                ..rollNumber(context.read<RollDiceCubit>().roll)
                ..definePlayerIndex();
              return null;
            },
            orElse: () => null,
          ),
        ),
        BlocListener<TurnTimerCubit, TurnTimerState>(
          listener: (context, state) => state.maybeWhen(
            timeOut: () {
              // Close dialog if there's any open
              !ModalRoute.of(context)!.isCurrent
                  ? Navigator.pop(context)
                  : null;
              return context.read<GameBoardCubit>().changePlayerId();
            },
            orElse: () => null,
          ),
        ),
        BlocListener<GameBoardCubit, GameBoardState>(
          listener: (context, state) => state.maybeWhen(
            error: () {
              return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: 'Please choose another pion'.text.base.make(),
                ),
              );
            },
            playerTurn: (playerId) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: 'Player $playerId\'s turn'.text.base.make(),
                ),
              );
              context.read<PoinCounterCubit>().updatePoint(
                    tempPoint: context.read<GameBoardCubit>().tempPoint,
                    tempScore: context.read<GameBoardCubit>().tempScore,
                    playerId: playerId,
                  );
              BlocProvider.of<TurnTimerCubit>(context).state.maybeWhen(
                    timeOut: () => context.read<TurnTimerCubit>()
                      ..resetTimer()
                      ..startTimer(),
                    orElse: () => context.read<TurnTimerCubit>()
                      ..stopTimer()
                      ..resetTimer()
                      ..startTimer(),
                  );
              return context.read<GameBoardCubit>().resetTempPointAndScore();
            },
            selectedTiles: () => Dialogs.moveOrBombDialog(context),
            gameFinished: () {
              context.read<GameTimerCubit>().stopTimer();
              context.read<TurnTimerCubit>().stopTimer();
              return Dialogs.gameFinishedDialog(
                context: context,
                playerId: context.read<GameBoardCubit>().playerId,
                playerAScore: context.read<GameTimerCubit>().isTimeOut
                    ? context.read<PoinCounterCubit>().playerAScore
                    : null,
                playerBScore: context.read<GameTimerCubit>().isTimeOut
                    ? context.read<PoinCounterCubit>().playerBScore
                    : null,
              );
            },
            orElse: () => null,
          ),
        ),
      ],
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: HStack([
            ElevatedButton(
              onPressed: () async {
                if (context.read<GameBoardCubit>().rolledNumber == 0) {
                  context.read<RollDiceCubit>()
                    ..reset()
                    ..rollDice(customRoll: setCustomRoll ? 2 : -1);
                }
              },
              child: 'Mulai'
                  .text
                  .xl2
                  .center
                  .make()
                  .box
                  .width(context.screenWidth - 150)
                  .withConstraints(const BoxConstraints(maxWidth: 415))
                  .make(),
            ),
          ]),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
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
              const GameBoard(),
            ],
          ).safeArea().px16(),
        ).centered(),
      ),
    );
  }
}
