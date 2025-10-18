import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

// import 'register_footer_widget.dart';
// import 'register_form_widget.dart';
import 'package:get/get.dart';
import '../../../../constants/text_strings.dart';
import 'welcome_header_widget.dart';
import '../register/register_screen.dart';
import '../login/login_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            child:
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WelcomeHeaderWidget(size: size),
                        const SizedBox(height: tFormHeight),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Get.to(const LoginScreen()),
                                child: Text(tLogin.toUpperCase()),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Get.to(const RegisterScreen()),
                                child: Text(tRegister.toUpperCase()),
                              ),
                            ),
                          ],
                        ),

                      ],
                    )
                    .animate()
                    .fadeIn(duration: 800.ms)
                    .slideY(begin: 0.2, curve: Curves.easeOut),
          ),
        ),
      ),
    );
  }
}
