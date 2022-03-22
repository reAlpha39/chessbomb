import 'package:bombernyaa/app/game/bloc/game_board/game_board_cubit.dart';
import 'package:bombernyaa/app/game/bloc/roll_dice/roll_dice_cubit.dart';
import 'package:bombernyaa/app/game/widgets/game_board.dart';
import 'package:bombernyaa/app/game/widgets/player_point.dart';
import 'package:bombernyaa/app/home/pages/home_page.dart';
import 'package:bombernyaa/injection.dart';
import 'package:bombernyaa/presentation/random_number_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
              context.read<GameBoardCubit>()
                ..rollNumber(context.read<RollDiceCubit>().roll)
                ..playerSelectableTile();
              return null;
            },
            orElse: () => null,
          ),
        ),
        BlocListener<GameBoardCubit, GameBoardState>(
          listener: (context, state) => state.maybeWhen(
            error: () {
              Get.snackbar(
                'Error',
                'Destroy the wall first',
                snackPosition: SnackPosition.TOP,
                colorText: Colors.black,
                backgroundColor: Colors.red,
                margin: const EdgeInsets.all(10),
              );
              return context.read<GameBoardCubit>().changeStateAfterError();
            },
            playerTurn: (playerId) => Get.snackbar(
              'Player Changed',
              'Player $playerId Turn',
              snackPosition: SnackPosition.TOP,
              colorText: Colors.black,
              backgroundColor: Colors.amberAccent,
              margin: const EdgeInsets.all(10),
            ),
            selectedTiles: () => Get.defaultDialog(
              title: 'Pilih Strategi',
              titleStyle: const TextStyle(fontSize: 24),
              content: VStack([
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<GameBoardCubit>()
                        .chooseStrategy(isMovePlayer: true);
                    Get.back();
                  },
                  child: 'Pindah pion'.text.xl.makeCentered().py8(),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<GameBoardCubit>()
                        .chooseStrategy(isMovePlayer: false);
                    Get.back();
                  },
                  child: 'Pasang bomb'.text.xl.makeCentered().py8(),
                ),
              ])
                  .centered()
                  .px8()
                  .box
                  .height(100)
                  .width(context.width - 180)
                  .make(),
            ),
            gameFinished: () => Get.defaultDialog(
              title: 'Game Finished',
              barrierDismissible: false,
              titleStyle: const TextStyle(fontSize: 24),
              middleText: 'You Win',
              textConfirm: 'Reset Game',
              confirmTextColor: Colors.white,
              textCancel: 'Main Menu',
              onConfirm: () {
                context.read<GameBoardCubit>().createBoardIndex();
                Get.back();
              },
              onCancel: () {
                context.read<GameBoardCubit>().createBoardIndex();
                Get.to(() => const HomePage());
              },
            ),
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
                  bool? result = await Get.defaultDialog(
                    title: 'Choose Strategy',
                    content: const ChooseStrategyDialogBody(),
                  );
                  if (result != null && result) {
                    result = null;
                    context.read<RollDiceCubit>()
                      ..reset()
                      ..rollDice();
                  } else if (result != null && !result) {
                    result = null;
                    int? skillIndex = await Get.defaultDialog(
                      title: 'Choose Skill',
                      content: const ChooseSkillDialogBody(),
                    );
                    if (skillIndex != null) {
                      context.read<GameBoardCubit>()
                        ..selectSkillIndex(skillIndex)
                        ..playerSelectableTile();
                    }
                  }
                },
                child: 'Start Turn'
                    .text
                    .xl2
                    .center
                    .make()
                    .py8()
                    .box
                    .width(context.screenWidth - 150)
                    .make(),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<GameBoardCubit>().changePlayerId(),
                child: const Icon(Icons.refresh).box.height(40).make(),
              ).pOnly(left: 8),
            ])),
        body: const VStack([
          PlayerPoint(),
          GameBoard(),
        ]).px16(),
      ),
    );
  }
}

class ChooseStrategyDialogBody extends StatelessWidget {
  const ChooseStrategyDialogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RollDiceCubit>(),
      child: VStack([
        Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => Get.back(result: true),
            child: 'Move / Bomb'.text.xl.makeCentered().py8(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () => Get.back(result: false),
          child: 'Use Skill'.text.xl.makeCentered().py8(),
        ),
      ]),
    ).centered().px8().box.height(100).width(context.width - 180).make();
  }
}

class ChooseSkillDialogBody extends StatelessWidget {
  const ChooseSkillDialogBody({Key? key}) : super(key: key);

  static final List<String> _titleButton = [
    'Vertical Bomb',
    'Horizontal Bomb',
    'Free Space',
    'Wallbang',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GameBoardCubit>(),
      child: ListView.builder(
        itemCount: _titleButton.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => ElevatedButton(
          onPressed: () => Get.back(result: index),
          child: _titleButton[index].text.xl.makeCentered().py8(),
        ).pOnly(bottom: index == 4 ? 0 : 10),
      ),
    ).centered().px8().box.height(250).width(context.width - 180).make();
  }
}
