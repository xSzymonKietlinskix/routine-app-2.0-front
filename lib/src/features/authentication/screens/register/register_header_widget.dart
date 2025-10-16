import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(tWelcomeScreenImage),
          height: size.height * 0.2,
        ),
        Text(tRegisterTitle, style: Theme.of(context).textTheme.headlineLarge),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}