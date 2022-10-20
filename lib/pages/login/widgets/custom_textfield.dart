import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String label;
  final bool? obscureText;
  final void Function(String)? onFieldSubmitted;

  const CustomTextField(
      {required this.label,
      this.onFieldSubmitted,
      this.textInputAction,
      this.obscureText,
      this.validator,
      this.keyboardType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 18, color: Colors.white),
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      cursorColor: Colors.white,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          labelStyle: const TextStyle(fontSize: 15),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          label: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          focusColor: Colors.white),
    );
  }
}
