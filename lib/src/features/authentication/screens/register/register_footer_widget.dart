import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../login/login_screen.dart';



class RegisterFooterWidget extends StatelessWidget {
  const RegisterFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () => Get.to(const LoginScreen()),

          child: Text.rich(
            TextSpan(
              text: tAlreadyHaveAccount,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: " $tSignIn",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}