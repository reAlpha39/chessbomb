import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart';
import 'package:bombernyaa/app/game/bloc/roll_dice/roll_dice_cubit.dart';
import 'package:bombernyaa/app/game/widgets/game_board.dart';
import 'package:bombernyaa/app/game/widgets/player_point.dart';
import 'package:bombernyaa/injection.dart';
import 'package:bombernyaa/presentation/random_number_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              Dialogs().showRandomNumber(
                title: 'Your Number',
                middleText: index.toString(),
              );
              context
                  .read<GameBoardCubit>()
                  .playerSelectableTile(playerId: '1');
              return null;
            },
            orElse: () => null,
          ),
        ),
        BlocListener<GameBoardCubit, GameBoardState>(
          listener: (context, state) {
            // TODO: implement listener
          },
        ),
      ],
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () => context.read<RollDiceCubit>()
              ..reset()
              ..rollDice(),
            child: 'Roll Dice'
                .text
                .xl2
                .center
                .make()
                .py8()
                .box
                .width(context.screenWidth - 150)
                .make(),
          ),
        ),
        body: const VStack([
          PlayerPoint(),
          GameBoard(),
        ]).px16(),
      ),
    );
  }
}
