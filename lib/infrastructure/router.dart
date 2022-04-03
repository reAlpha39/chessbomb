import 'package:bombernyaa/app/game/pages/game_page.dart';
import 'package:bombernyaa/app/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'game_page',
      path: '/game_page',
      builder: (context, state) => const GamePage(),
    ),
  ],
);
