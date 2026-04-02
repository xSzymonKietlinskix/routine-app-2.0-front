import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine_app_front/src/constants/sizes.dart';

import '../../constants/colors.dart'; // Upewnij się, że to masz, jeśli używasz GoogleFonts

class TFloatingActionButtonTheme {
  TFloatingActionButtonTheme._();

  static FloatingActionButtonThemeData lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
      backgroundColor: tPrimary,
      foregroundColor: Colors.white,

      extendedTextStyle: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  );

  static FloatingActionButtonThemeData darkFloatingActionButtonTheme = FloatingActionButtonThemeData(

      backgroundColor: Colors.white70,
      foregroundColor: tPrimary,

      extendedTextStyle: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

  );
}