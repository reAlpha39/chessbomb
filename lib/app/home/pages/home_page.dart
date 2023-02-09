import 'dart:io' show Platform;

import 'package:bombernyaa/app/home/bloc/cubit/player_id_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 72),
          Image.asset(
            "assets/images/logo.png",
            height: 140,
            width: 140,
          ),
          Text(
            'CHESS',
            style: TextStyle(
                fontSize: 52,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lilitaOne().fontFamily),
          ),
          Text(
            'BOMB',
            style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lilitaOne().fontFamily),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
            ),
            child: ElevatedButton(
              onPressed: () => context.pushNamed('game_page'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFD3B14E))),
              child: Text(
                'MULAI',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: GoogleFonts.secularOne().fontFamily,
                ),
              ).px12(),
            ),
          ),
          kIsWeb
              ? const SizedBox()
              : Platform.isAndroid
                  ? Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: ElevatedButton(
                        onPressed: () => SystemNavigator.pop(),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFD3B14E))),
                        child: Text(
                          'KELUAR',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: GoogleFonts.secularOne().fontFamily,
                          ),
                        ).px8(),
                      ),
                    )
                  : const SizedBox(),
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
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFD3B14E))),
                      child: const Text(
                        'Player pion +100',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFD3B14E))),
                      child: const Text(
                        'Menang dengan kondisi\nBendera lawan diambil',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFD3B14E))),
                      child: const Text(
                        'Menang dengan kondisi\nPion lawan habis',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ).scrollVertical().centered(),
    );
  }
}
