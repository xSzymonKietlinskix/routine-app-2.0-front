import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class WelcomeHeaderWidget extends StatelessWidget {
  const WelcomeHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'test',
          child: Image(
            image: AssetImage(tWelcomeScreenImage),
            height: size.height * 0.5
          ),
        ),
        Text(tWelcomeTitle, style: Theme.of(context).textTheme.headlineLarge),
        Text(tWelcomeSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}