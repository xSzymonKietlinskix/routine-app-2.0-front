import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme{

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.outfit(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 20,
      color: Colors.black54,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: GoogleFonts.outfit(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ),
      headlineMedium: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white54,
      ),
      bodyMedium: GoogleFonts.outfit(
        fontSize: 20,
        color: Colors.white54,
      ),
  );
}