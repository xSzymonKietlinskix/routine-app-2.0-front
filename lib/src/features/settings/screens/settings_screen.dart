import 'package:flutter/material.dart';
import 'package:routine_app_front/src/constants/text_strings.dart';

// Pamiętaj o imporcie swoich nowych widgetów (jeśli są w tym samym folderze, wystarczą same nazwy plików):
import '../widgets/settings_account_widget.dart';
import '../widgets/settings_preferences_widget.dart';
import '../widgets/settings_appearance_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(tSettings),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column( // Dodano 'const', bo wszystkie dzieci są teraz const
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsAppearanceWidget(),
                // SettingsPreferencesWidget(),
                SettingsAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}