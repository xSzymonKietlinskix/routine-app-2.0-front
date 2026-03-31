import 'package:flutter/material.dart';
import 'package:routine_app_front/src/constants/text_strings.dart';
// Upewnij się, że ta ścieżka zgadza się z Twoją nazwą projektu!
import 'package:routine_app_front/src/repository/authentication_repository/authentication_repository.dart';

class SettingsAccountWidget extends StatelessWidget {
  const SettingsAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.redAccent),
      title: const Text(
        tLogout,
        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        // Wywołanie wylogowywania z Twojego repozytorium
        AuthenticationRepository.instance.logout();
      },
    );
  }
}