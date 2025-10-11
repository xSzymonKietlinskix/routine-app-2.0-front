import 'package:flutter/material.dart';

import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../constants/text_styles.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: tDontHaveAccount,
              style: AppTextStyles.body,
              children: [
                TextSpan(
                  text: " $tSignUp",
                  style: AppTextStyles.body.copyWith(
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