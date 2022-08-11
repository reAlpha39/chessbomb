import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart';
import 'package:bombernyaa/app/game/bloc/poin_counter/poin_counter_cubit.dart';
import 'package:bombernyaa/app/game/bloc/roll_dice/roll_dice_cubit.dart';
import 'package:bombernyaa/app/game/widgets/game_board.dart';
import 'package:bombernyaa/app/game/widgets/player_point.dart';
import 'package:bombernyaa/injection.dart';
import 'package:bombernyaa/presentation/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GameBoardCubit>()..createBoardIndex(),
        ),
        BlocProvider(
          create: (context) => getIt<RollDiceCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<PoinCounterCubit>(),
        ),
      ],
      child: const _GameLayout(),
    );
  }
}

class _GameLayout extends StatelessWidget {
  const _GameLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
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
        BlocListener<GameBoardCubit, GameBoardState>(
          listener: (context, state) => state.maybeWhen(
            error: () {
              return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: 'Destroy the wall first'.text.base.make(),
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
                    playerId: playerId,
                  );
              return context.read<GameBoardCubit>().resetTempPoint();
            },
            selectedTiles: () => Dialogs.moveOrBombDialog(context),
            gameFinished: () => Dialogs.gameFinishedDialog(context),
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
                  bool? result = await Dialogs.chooseStrategyDialog(context);
                  if (result != null && result) {
                    result = null;
                    context.read<RollDiceCubit>()
                      ..reset()
                      ..rollDice();
                  } else if (result != null && !result) {
                    result = null;
                    int? skillIndex = await Dialogs.chooseSkillDialog(
                      context: context,
                      skillPrice: context.read<GameBoardCubit>().skillPrices,
                      point: context.read<GameBoardCubit>().playerId == '1'
                          ? context.read<PoinCounterCubit>().playerAPoint
                          : context.read<PoinCounterCubit>().playerBPoint,
                    );
                    if (skillIndex != null) {
                      context.read<GameBoardCubit>()
                        ..selectSkillIndex(skillIndex)
                        ..definePlayerIndex();
                    }
                  }
                }
              },
              child: 'Start Turn'
                  .text
                  .xl2
                  .center
                  .make()
                  .box
                  .width(context.screenWidth - 150)
                  .make(),
            ),
          ]),
        ),
        body: const VStack([
          PlayerPoint(),
          GameBoard(),
        ]).px16(),
      ),
    );
  }
}
