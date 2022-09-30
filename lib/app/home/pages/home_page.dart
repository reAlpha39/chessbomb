import 'package:bombernyaa/app/home/bloc/cubit/player_id_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../game/pages/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerIdCubit(),
      child: const Scaffold(
        body: _HomeBody(),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 24.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          const Text(
            'Welcome to BomberNyaa',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24.0,
              ),
              child: TextField(
                controller: context.read<PlayerIdCubit>().playerId,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Masukkan username",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
            ),
            child: ElevatedButton(
              onPressed: () => context.pushNamed('game_page'),
              child: const Text(
                'Start',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          kDebugMode
              ? Column(
                  children: [
                    const SizedBox(height: 16),
                    'Debug Mode'.text.size(32).bold.makeCentered(),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const GamePage(debugModeAddPoint: true),
                        ),
                      ),
                      child: const Text(
                        'Player pion +100',
                        style: TextStyle(fontSize: 18),
                      ).px(38),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const GamePage(debugModeWinConditionA: true),
                        ),
                      ),
                      child: const Text(
                        'Menang dengan kondisi\nBendera lawan diambil',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const GamePage(debugModeWinConditionB: true),
                        ),
                      ),
                      child: const Text(
                        'Menang dengan kondisi\nPion lawan habis',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const GamePage(debugModeWinConditionC: true),
                        ),
                      ),
                      child: const Text(
                        'Menang dengan kondisi\nTimeout',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ).scrollVertical(),
    );
  }
}
