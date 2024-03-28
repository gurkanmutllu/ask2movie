import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.inputType,
    this.isObscure = false,
    super.key,
  });

  final String labelText;
  final TextInputType inputType;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.verticalPadding,
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        keyboardType: inputType,
      ),
    );
  }
}
