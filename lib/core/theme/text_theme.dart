import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeLaxmiSetu {
  static final textTheme = TextTheme(
    headlineLarge: GoogleFonts.redHatDisplay(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.redHatDisplay(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.urbanist(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.urbanist(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    labelMedium: GoogleFonts.lexend(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.lexend(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
