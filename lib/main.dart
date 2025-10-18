import 'package:flutter/material.dart';
import 'package:routine_app_front/src/utilis/theme/theme.dart';
import 'src/features/authentication/screens/login/login_screen.dart';
import 'src/features/authentication/screens/register/register_screen.dart';
import 'src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

void main() => runApp(const RoutineApp());

class RoutineApp extends StatelessWidget {
  const RoutineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WelcomeScreen());
  }
}
