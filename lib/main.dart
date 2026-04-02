import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:routine_app_front/src/repository/authentication_repository/authentication_repository.dart';
import 'package:routine_app_front/src/utilis/theme/theme.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:routine_app_front/src/repository/calendar_repository/calendar_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationRepository()); // To już miałeś/aś
    Get.put(CalendarRepository());
  });
  runApp(const RoutineApp());
}

class RoutineApp extends StatelessWidget {
  const RoutineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const CircularProgressIndicator(),
    );
  }
}

// class AppHome extends StatelessWidget {
//   const AppHome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: BottomNavigationScreen());
//   }
// }
