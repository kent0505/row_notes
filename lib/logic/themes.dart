import 'package:flutter/material.dart';

class Themes {
  ThemeData darkTheme = ThemeData(
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: const Color(0xff1e1e1e),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.grey,
      cursorColor: Colors.grey,
      selectionHandleColor: Colors.grey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.grey),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.grey[800],
      brightness: Brightness.dark,
    ),
  );
}
