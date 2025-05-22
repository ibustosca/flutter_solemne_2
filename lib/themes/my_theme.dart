import 'package:flutter/material.dart';

class MyTheme {
  static const Color primary = Colors.blueGrey;
  static final ThemeData myTheme = ThemeData(
    primaryColor: primary,
    brightness: Brightness.light,
    fontFamily: 'Releway',
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(162, 255, 87, 3),
      elevation: 20,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
  );
}
