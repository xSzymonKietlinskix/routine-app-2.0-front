import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine_app_front/src/constants/sizes.dart';

import '../../constants/colors.dart'; // Upewnij się, że to masz, jeśli używasz GoogleFonts

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: tPrimary,
      foregroundColor: Colors.white,

      textStyle: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      padding: const EdgeInsets.symmetric(vertical: tDefaultPadding * 0.5),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white70,
      foregroundColor: tPrimary,

      textStyle: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      padding: const EdgeInsets.symmetric(vertical: tDefaultPadding * 0.5),
    ),
  );
}