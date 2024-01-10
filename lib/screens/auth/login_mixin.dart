import 'package:flutter/material.dart';

mixin LoginMixin  {
  final TextEditingController emailController = TextEditingController(text: 'bob@CustodyRx.com');
  final TextEditingController passwordController = TextEditingController(text: 'custodyrx');

  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  void onClick(Function() callback) {
    if (formKey.currentState!.validate()) {
      callback();
      // NavigationService.navigateToWithClearStack(AppRoutes.dashboardScreen);
    }
  }
}
