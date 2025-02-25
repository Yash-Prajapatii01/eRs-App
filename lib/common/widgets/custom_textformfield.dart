import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFormFieldCustom(
      {super.key,
      this.controller,
      required this.hintText,
      this.validator,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xff037dff),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorMaxLines: 2,
        isDense: false,
        // Reduces field's vertical height
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        errorStyle: TextStyle(height: 1.0),
      ),
      validator: validator,
    );
  }
}
