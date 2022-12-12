import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bombernyaa/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../app/game/bloc/game_board/game_board_cubit.dart';
import '../app/game/bloc/roll_dice/roll_dice_cubit.dart';

class Dialogs {
  static final List<String> _titleButton = [
    'Bom Vertikal',
    'Bom Horizontal',
    'Gerak Segala Arah',
    'Dinding',
  ];

  static String _diceAsset(String diceNumber) {
    switch (diceNumber) {
      case '1':
        return 'assets/images/straight_1.png';
      case '2':
        return 'assets/images/straight_2.png';
      case '3':
        return 'assets/images/straight_3.png';
      case '4':
        return 'assets/images/diagonal_1.png';
      case '5':
        return 'assets/images/diagonal_2.png';
      case '6':
        return 'assets/images/diagonal_3.png';
      default:
        return 'assets/images/L.png';
    }
  }

  static bool showGameSessionForceEndDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      width: context.screenWidth > 500 ? 500 : context.screenWidth - 50,
      animType: AnimType.scale,
      title: 'Apakah ingin mengakhiri permainan?',
      btnOk: TextButton(
        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.red,
          backgroundColor: Colors.red,
        ),
        child: 'Ya'.text.xl.white.bold.makeCentered(),
      ),
      btnCancel: TextButton(
        onPressed: () => Navigator.pop(context),
        child: 'Tidak'.text.xl.bold.black.makeCentered(),
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
      width: context.screenWidth > 500 ? 500 : context.screenWidth - 50,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      body: Column(
        children: [
          Image.asset(_diceAsset(middleText)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: 'OK'.text.xl.bold.make(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ).show();
  }

  static chooseStrategyDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: context.screenWidth > 500 ? 500 : context.screenWidth - 50,
      animType: AnimType.scale,
      dialogType: DialogType.question,
      title: 'Pilih Aksi',
      body: BlocProvider(
        create: (context) => getIt<RollDiceCubit>(),
        child: VStack([
          'Pilih Aksi'.text.xl.makeCentered(),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: 'Strategi'.text.xl.makeCentered().py8(),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: 'Skill'.text.xl.makeCentered().py8(),
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
      width: context.screenWidth > 500 ? 500 : context.screenWidth - 50,
      animType: AnimType.scale,
      dialogType: DialogType.question,
      title: 'Pilih Skill',
      body: BlocProvider(
        create: (context) => getIt<GameBoardCubit>(),
        child: Column(
          children: [
            'Pilih Skill'.text.xl.makeCentered(),
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
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: 'Kembali'.text.xl.makeCentered().py8(),
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
      width: context.screenWidth > 500 ? 500 : context.screenWidth - 50,
      animType: AnimType.scale,
      dialogType: DialogType.question,
      title: 'Pilih Strategi',
      body: VStack([
        Center(
          child: 'Pilih Strategi'.text.xl.makeCentered(),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.read<GameBoardCubit>().chooseStrategy(isMovePlayer: true);
            Navigator.of(context).pop();
          },
          child: 'Pindah Pion'.text.xl.makeCentered().py8(),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<GameBoardCubit>().chooseStrategy(isMovePlayer: false);
            Navigator.of(context).pop();
          },
          child: 'Bom'.text.xl.makeCentered().py8(),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: 'Kembali'.text.xl.makeCentered().py8(),
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
      width: context.screenWidth > 500 ? 500 : context.screenWidth - 50,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      title: playerAScore != null
          ? playerAScore == playerBScore!
              ? 'Seri'
              : 'Permainan Selesai'
          : 'Permainan Selesai',
      body: VStack([
        playerAScore != null
            ? playerAScore == playerBScore!
                ? const SizedBox()
                : 'Permainan Selesai'.text.medium.makeCentered()
            : 'Permainan Selesai'.text.medium.makeCentered(),
        (playerAScore != null
                ? playerAScore == playerBScore!
                    ? 'Seri'
                    : ('Player ' +
                        (playerAScore > playerBScore ? '1' : '2') +
                        ' Menang')
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
