import 'package:custody_rx/app/app_strings.dart';

extension EmailValidation on String {
  String? validateEmail() {
    // Check if the email is empty
    if (isEmpty) {
      return AppStrings.enterEmail;
    }

    // Regular expression for a valid email address
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    // Check if the email matches the regular expression
    if (!emailRegex.hasMatch(this)) {
      return AppStrings.incorrectEmail;
    }

    // No validation issues, return null
    return null;
  }
}

extension PasswordValidation on String {
  String? validatePassword() {
    // Check if the password is empty
    if (isEmpty) {
      return AppStrings.enterPassword;
    }

    // Check if the password meets the minimum length requirement
    if (length < 4) {
      return AppStrings.mustBe4characters;
    }

    // No validation issues, return null
    return null;
  }
}
