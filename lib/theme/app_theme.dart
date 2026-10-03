import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,

      brightness: Brightness.dark,

      scaffoldBackgroundColor:
      const Color(0xFF0D1115),

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFD4773A),
        brightness: Brightness.dark,
      ),
    );
  }

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,

      brightness: Brightness.light,

      scaffoldBackgroundColor:
      const Color(0xFFF7F5F2),

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFB76532),
        brightness: Brightness.light,
      ),
    );
  }
}