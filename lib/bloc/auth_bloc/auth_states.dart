
import 'package:custody_rx/models/user/login_user_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}
//This is innitial state of bloc
class AuthInitial extends AuthState {}
//This is the loading state of bloc
class AuthPageLoading extends AuthState {}
//This is the success state of bloc
class AuthPageLoaded extends AuthState {
  late final LoginUserModel data;
  AuthPageLoaded(this.data);
}
//This is the error state of bloc
class AuthPageError extends AuthState {
  late final String errorMessage;
  AuthPageError(this.errorMessage);
}

class PasswordVisibilityToggled extends AuthState {
  final bool isPasswordVisible;

  PasswordVisibilityToggled(this.isPasswordVisible);
}


