import 'package:flutter/material.dart';
import 'package:routine_app_front/src/utilis/theme/text_theme.dart';

class TAppTheme {

  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,

  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
  );
}
