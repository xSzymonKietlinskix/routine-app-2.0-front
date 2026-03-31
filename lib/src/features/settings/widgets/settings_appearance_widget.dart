import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine_app_front/src/constants/text_strings.dart';

// Zmieniliśmy na StatefulWidget
class SettingsAppearanceWidget extends StatefulWidget {
  const SettingsAppearanceWidget({super.key});

  @override
  State<SettingsAppearanceWidget> createState() => _SettingsAppearanceWidgetState();
}

class _SettingsAppearanceWidgetState extends State<SettingsAppearanceWidget> {
  // Zmienna przechowująca aktualny stan przełącznika
  // Na start pobiera informację, czy aplikacja jest w trybie ciemnym
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = Get.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
         tTheme,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        
        SwitchListTile(
          secondary: const Icon(Icons.dark_mode),
          title: const Text(tDarkTheme),
          // Używamy naszej lokalnej zmiennej
          value: isDarkMode, 
          activeThumbColor: Colors.blue,
          onChanged: (bool newValue) {
            // setState odświeża TYLKO ten mały przełącznik na ekranie
            setState(() {
              isDarkMode = newValue;
            });

            // GetX zajmuje się zmianą kolorów w całej reszcie aplikacji
            if (newValue) {
              Get.changeThemeMode(ThemeMode.dark);
            } else {
              Get.changeThemeMode(ThemeMode.light);
            }
          },
        ),
        
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}