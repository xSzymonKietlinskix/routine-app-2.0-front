import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

// import 'register_footer_widget.dart';
// import 'register_form_widget.dart';
import '../../../../constants/text_strings.dart';
import 'welcome_header_widget.dart';
import '../register/register_screen.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeHeaderWidget(size: size),
                const SizedBox(height: tFormHeight),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Text(tLogin.toUpperCase()),
                        ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: Text(tRegister.toUpperCase()),
                        ),
                    ),
                  ],
                ),
                // const LoginForm(),
                // const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
