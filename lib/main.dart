import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './cubit/note_cubit.dart';
import './pages/home/home_page.dart';
import './logic/themes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');

  await Future.delayed(const Duration(seconds: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Themes themes = Themes();

    return BlocProvider(
      create: (context) => NoteCubit({})..restoreData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themes.darkTheme,
        home: const HomePage(),
        initialRoute: '/',
        routes: {
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
