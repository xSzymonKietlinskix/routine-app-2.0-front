import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:routine_app_front/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();
  final name = TextEditingController();

  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);

  }
}