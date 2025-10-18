import 'package:flutter/material.dart';
import 'package:routine_app_front/src/repository/authentication_repository/authentication_repository.dart';


import '../../../constants/sizes.dart';

// import 'login_footer_widget.dart';
// import 'login_form_widget.dart';
// import 'login_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery
    //     .of(context)
    //     .size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HOME SCREEN"),
                IconButton(
                  onPressed: () {AuthenticationRepository.instance.logout();},
                  icon: Icon(Icons.logout),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


