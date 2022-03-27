import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff0172C0),
            secondary: const Color(0xff2D84C8)),
        scaffoldBackgroundColor: const Color(0xff0172C0),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xff0172C0),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff0172C0),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.shifting,
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black.withOpacity(.5)),
          headline1: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff0172C0),
              fontSize: 36),
        ));
  }
}
