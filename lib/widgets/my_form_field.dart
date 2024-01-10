import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autofocus;
  final bool filled;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const MyFormField({
    Key? key,
    this.validator,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.autofocus = false,
    this.filled = false,
    this.suffixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      autofocus: autofocus,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        
        filled: filled,
        labelText: labelText,
        hintText: hintText,
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
