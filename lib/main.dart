import 'package:bombernyaa/app/home/bloc/cubit/player_id_cubit.dart';
import 'package:bombernyaa/app/home/pages/home_page.dart';
import 'package:bombernyaa/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BomberNyaa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<PlayerIdCubit>(),
        child: const HomePage(),
      ),
    );
  }
}
