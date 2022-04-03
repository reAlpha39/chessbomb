import 'package:bombernyaa/app/home/bloc/cubit/player_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerIdCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BomberNyaa"),
        ),
        body: const _HomeBody(),
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
              child: const Text('Click Here'),
            ),
          )
        ],
      ),
    );
  }
}
