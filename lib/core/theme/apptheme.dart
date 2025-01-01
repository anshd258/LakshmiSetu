import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakshmi_setu/core/theme/color_theme.dart';
import 'package:lakshmi_setu/core/theme/text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorTheme.lightColorScheme,
    textTheme: TextThemeLaxmiSetu.textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    scaffoldBackgroundColor: ColorTheme.lightColorScheme.surface,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorTheme.lightColorScheme.primary,
        side: BorderSide(color: ColorTheme.lightColorScheme.primary),
        textStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorTheme.lightColorScheme.primary,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.lexend(fontWeight: FontWeight.w600),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorTheme.darkColorScheme,
    textTheme: TextThemeLaxmiSetu.textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    scaffoldBackgroundColor: ColorTheme.darkColorScheme.surface,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorTheme.darkColorScheme.primary,
        side: BorderSide(color: ColorTheme.darkColorScheme.primary),
        textStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorTheme.darkColorScheme.primary,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.lexend(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
