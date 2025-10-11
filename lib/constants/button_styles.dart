
import 'package:flutter/material.dart';
import 'colors.dart';
import 'sizes.dart';
import 'text_styles.dart';

class AppButtonStyles {
  static final ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.buttonBackground,
    padding: EdgeInsets.symmetric(horizontal: tDefaultPadding * 0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: AppTextStyles.button.copyWith(
      color: Colors.white,),
  );

  static final ButtonStyle secondary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondary,
    padding: EdgeInsets.symmetric(vertical: tDefaultPadding),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: AppTextStyles.button.copyWith(
      color: Colors.white,
    ),
  );

  static final ButtonStyle small = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: AppTextStyles.body.copyWith(
      color: Colors.white,
    ),
  );
}
