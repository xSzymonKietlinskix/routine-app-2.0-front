import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:routine_app_front/src/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController{
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void loginUser(String email, String password){
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }
}