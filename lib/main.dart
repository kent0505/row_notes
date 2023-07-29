import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './cubit/note_cubit.dart';
import './cubit/test_cubit.dart';
import './pages/home/home_page.dart';
import './pages/test/test_page.dart';
import './pages/pincode/pincode_page.dart';
import './logic/themes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  // Hive.box('mybox').clear();
  await Future.delayed(const Duration(seconds: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Themes themes = Themes();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit({})..restoreData(),
        ),
        BlocProvider(
          create: (context) => TestCubit([]),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themes.darkTheme,
        home: const HomePage(),
        // home: const TestPage(),
        initialRoute: '/',
        routes: {
          '/home': (context) => const HomePage(),
          '/test': (context) => const TestPage(),
          '/pincode': (context) => const PincodePage(),
        },
      ),
    );
  }
}
