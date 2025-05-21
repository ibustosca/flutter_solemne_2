import 'package:flutter/material.dart';

class MyTheme {
  static const Color primary = Colors.blueGrey;
  static final ThemeData myTheme = ThemeData(
    primaryColor: primary,
    brightness: Brightness.light,
    fontFamily: 'Releway',
    appBarTheme: const AppBarTheme(color: primary, elevation: 20),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
  );
}
