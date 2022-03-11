import 'package:bombernyaa/app/game/bloc/cubit/game_board_cubit.dart';
import 'package:bombernyaa/app/game/widgets/game_board.dart';
import 'package:bombernyaa/app/game/widgets/player_point.dart';
import 'package:bombernyaa/app/home/bloc/cubit/player_id_cubit.dart';
import 'package:bombernyaa/injection.dart';
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
          create: (context) => getIt<PlayerIdCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GameBoardCubit>(),
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
    return Scaffold(
      body: const VStack([
        PlayerPoint(),
        GameBoard(),
      ]).px16(),
    );
  }
}
