import 'package:flutter/material.dart';


import '../../../../constants/sizes.dart';
import 'register_footer_widget.dart';
import 'register_form_widget.dart';
import 'register_header_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                RegisterHeaderWidget(size: size),
                const RegisterForm(),
                const RegisterFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


