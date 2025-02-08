import 'package:flutter/material.dart';

class AppThem {
  static const Color black = Color(0xff171717);
  static const Color white = Color(0xffFFFFFF);
  static const Color grey = Color(0xffA0A0A0);
  static ThemeData lightMode = ThemeData();
  static ThemeData darkMode = ThemeData(
    primaryColor: black,
    appBarTheme: AppBarTheme(
      foregroundColor: white,
      backgroundColor: black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: black,
    textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: white,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: white,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: white,
        ),
        labelMedium:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: grey),
        labelLarge:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white)),
  );
}
