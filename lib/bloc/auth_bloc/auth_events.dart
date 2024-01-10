import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {}

class AuthFetchDataEvent extends AuthEvent {
  final String email;
  final String password;
  AuthFetchDataEvent(this.email,this.password);
}

class TogglePasswordVisibilityEvent extends AuthEvent {}