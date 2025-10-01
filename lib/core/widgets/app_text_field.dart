import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.contentPadding,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
