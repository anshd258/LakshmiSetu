import 'package:flutter/material.dart';

class ColorTheme {
  static final lightColorScheme = ColorScheme(
    primary: const Color(0xFF0077FF),
    onPrimary: Colors.white,
    secondary: const Color(0xFFE9BBB5),
    onSecondary: Colors.black,
    surface: const Color.fromARGB(255, 239, 236, 248),
    onSurface: Colors.black,
    error: const Color(0xFFF44336),
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static final darkColorScheme = ColorScheme(
    primary: const Color(0xFF0077FF),
    onPrimary: Colors.black,
    secondary: const Color(0xFFBDA47E),
    onSecondary: Colors.white,
    surface: const Color(0xFF1E1E1E),
    onSurface: Colors.white,
    error: const Color(0xFFCF6679),
    onError: Colors.black,
    brightness: Brightness.dark,
  );
}
