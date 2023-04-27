import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryColor = Colors.deepPurple;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryColor
      )
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryColor
      )
  );

}
