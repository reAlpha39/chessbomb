import 'package:bombernyaa/infrastructure/router.dart';
import 'package:bombernyaa/injection.dart';
import 'package:bombernyaa/presentation/theme.dart';
import 'package:flutter/material.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'BomberNyaa',
      theme: theme(),
    );
  }
}
