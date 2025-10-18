import 'package:routine_app_front/src/constants/text_strings.dart';

class SignupValidator {
  static String? name(String? v) {
    if (v == null || v.trim().isEmpty) {
      return tNoName;
    }
    else if(v.length < 3){
      return tWrongName;
    }
    return null;
  }

  static String? email(String? v) {
    if (v == null || v
        .trim()
        .isEmpty) {
      return tNoEmail;
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(v)) {
      return tWrongEmail;
    }
    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) {
      return tNoPassword;
    }
    if (v.length < 6) {
      return tWrongPassword;
    }
    return null;
  }

  static String? rePassword(String? v, String password) {
    if (v == null || v.isEmpty) {
      return tNoPassword;
    }
    if (v != password) {
      return tWrongReTypePassword;
    }
    return null;
  }

}