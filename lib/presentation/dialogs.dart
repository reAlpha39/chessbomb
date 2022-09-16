import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bombernyaa/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

import '../app/game/bloc/game_board/game_board_cubit.dart';
import '../app/game/bloc/roll_dice/roll_dice_cubit.dart';

class Dialogs {
  static final List<String> _titleButton = [
    'Vertical Bomb',
    'Horizontal Bomb',
    'Free Space',
    'Wallbang',
  ];

  static bool showGameSessionForceEndDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.SCALE,
      title: 'Are you sure to end the game?',
      btnOk: TextButton(
        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.red,
          backgroundColor: Colors.red,
        ),
        child: 'OK'.text.xl.white.bold.makeCentered(),
      ),
      btnCancel: TextButton(
        onPressed: () => Navigator.pop(context),
        child: 'Cancel'.text.xl.bold.black.makeCentered(),
      ),
    ).show();
    return false;
  }

  static void showRandomNumber({
    required BuildContext context,
    required String title,
    required String middleText,
  }) {
    AwesomeDialog(
      context: context,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: context.screenWidth - 100,
      dialogType: DialogType.INFO,
      animType: AnimType.SCALE,
      title: 'Your Number',
      customHeader: middleText.text.size(100).makeCentered(),
      btnOk: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: 'OK'
            .text
            .xl
            .bold
            .make()
            .px16()
            .py8()
            .box
            .rounded
            .color(Colors.blue.shade100)
            .make(),
      ),
    ).show();
  }

  static chooseStrategyDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: context.screenWidth - 100,
      animType: AnimType.SCALE,
      dialogType: DialogType.QUESTION,
      title: 'Choose Strategy',
      body: BlocProvider(
        create: (context) => getIt<RollDiceCubit>(),
        child: VStack([
          'Choose Strategy'.text.xl.makeCentered(),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: 'Move / Bomb'.text.xl.makeCentered().py8(),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: 'Use Skill'.text.xl.makeCentered().py8(),
          ),
          const SizedBox(
            height: 16,
          ),
        ]),
      ).centered().px8(),
    ).show();
  }

  static chooseSkillDialog(
      {required BuildContext context,
      required int point,
      required List<int> skillPrice}) {
    return AwesomeDialog(
      context: context,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: context.screenWidth - 100,
      animType: AnimType.SCALE,
      dialogType: DialogType.QUESTION,
      title: 'Choose Skill',
      body: BlocProvider(
        create: (context) => getIt<GameBoardCubit>(),
        child: Column(
          children: [
            'Choose Skill'.text.xl.makeCentered(),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: _titleButton.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: point >= skillPrice[index]
                    ? () => Navigator.of(context).pop(index)
                    : null,
                child: (_titleButton[index] +
                        ' (' +
                        skillPrice[index].toString() +
                        'P)')
                    .text
                    .xl
                    .makeCentered()
                    .py8(),
              ).pOnly(bottom: index == 4 ? 0 : 10),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ).centered().px8(),
    ).show();
  }

  static moveOrBombDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: context.screenWidth - 100,
      animType: AnimType.SCALE,
      dialogType: DialogType.QUESTION,
      title: 'Move or Bomb',
      body: VStack([
        Center(
          child: 'Move or Bomb'.text.xl.makeCentered(),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.read<GameBoardCubit>().chooseStrategy(isMovePlayer: true);
            Navigator.of(context).pop();
          },
          child: 'Pindah pion'.text.xl.makeCentered().py8(),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<GameBoardCubit>().chooseStrategy(isMovePlayer: false);
            Navigator.of(context).pop();
          },
          child: 'Pasang bomb'.text.xl.makeCentered().py8(),
        ),
        const SizedBox(
          height: 16,
        ),
      ]).centered().px8(),
    ).show();
  }

  static gameFinishedDialog({
    required BuildContext context,
    required String playerId,
    int? playerAScore,
    int? playerBScore,
  }) {
    return AwesomeDialog(
      dismissOnTouchOutside: false,
      context: context,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: context.screenWidth - 100,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      title: playerAScore != null
          ? playerAScore == playerBScore!
              ? 'Draw'
              : 'Game Finished'
          : 'Game Finished',
      body: VStack([
        playerAScore != null
            ? playerAScore == playerBScore!
                ? const SizedBox()
                : 'Game Finished'.text.medium.makeCentered()
            : 'Game Finished'.text.medium.makeCentered(),
        (playerAScore != null
                ? playerAScore == playerBScore!
                    ? 'Draw'
                    : ('Player ' +
                        (playerAScore > playerBScore ? '1' : '2') +
                        ' Win')
                : ('Player ' + playerId))
            .text
            .xl
            .bold
            .makeCentered()
            .py16(),
        ElevatedButton(
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
          child: 'Main Menu'.text.base.makeCentered(),
        ).centered(),
        const SizedBox(
          height: 16,
        ),
      ]),
    ).show();
  }
}
