import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';



// import 'login_footer_widget.dart';
// import 'login_form_widget.dart';
// import 'login_header_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CALENDAR SCREEN")
                // LoginHeaderWidget(size: size),
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


