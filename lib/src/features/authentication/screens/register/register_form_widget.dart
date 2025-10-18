import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/signup_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tName,
                hintText: tName,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.rePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tReTypePassword,
                hintText: tReTypePassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                  }

                },
                child: Text(tRegister.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
