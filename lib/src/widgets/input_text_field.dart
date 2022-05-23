import 'package:flutter/material.dart';

import '../core/constants/dimensions.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? labelText;

  const InputTextField({
    Key? key,
    this.controller,
    this.onSubmitted,
    this.textInputAction,
    this.prefixIcon,
    required this.hintText,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: onSubmitted,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 24,
            bottom: 16,
            right: Dimensions.big,
            left: Dimensions.big,
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          alignLabelWithHint: true,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 64,
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
