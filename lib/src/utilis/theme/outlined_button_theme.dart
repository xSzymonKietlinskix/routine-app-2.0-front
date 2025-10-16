import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine_app_front/src/constants/sizes.dart';

import '../../constants/colors.dart'; // Upewnij się, że to masz, jeśli używasz GoogleFonts

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white70,
      foregroundColor: tPrimary,
      side: BorderSide(color: tPrimary),

      textStyle: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      padding: const EdgeInsets.symmetric(vertical: tDefaultPadding * 0.5),
    ),
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: tPrimary,
      foregroundColor: Colors.white70,
      side: BorderSide(color: tPrimary),

      textStyle: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      padding: const EdgeInsets.symmetric(vertical: tDefaultPadding * 0.5),
    ),
  );
}