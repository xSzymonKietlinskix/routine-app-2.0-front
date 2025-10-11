import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  static final TextStyle headline1 = GoogleFonts.outfit(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final TextStyle headline2 = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final TextStyle body = GoogleFonts.outfit(
    fontSize: 20,
    color: AppColors.textSecondary,
  );

  static final TextStyle small = GoogleFonts.outfit(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static final TextStyle button = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonTextColor,
  );
}
