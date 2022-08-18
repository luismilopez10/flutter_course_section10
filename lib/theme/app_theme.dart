import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
        centerTitle: true,
      ),

      // BottomNavigationBar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primary,
      ),

      // FloatingActionButton Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
      ),

      // ListTile Theme
      listTileTheme: const ListTileThemeData(
        iconColor: primary,
      ));
}
