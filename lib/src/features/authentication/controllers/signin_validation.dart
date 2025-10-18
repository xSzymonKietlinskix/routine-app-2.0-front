import 'package:routine_app_front/src/constants/text_strings.dart';

class SigninValidator {
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

}