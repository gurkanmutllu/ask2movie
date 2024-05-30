import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.labelText,
    required this.inputType,
    this.validator,
    this.controller,
    this.isObscure = false,
    super.key,
  });

  final String labelText;
  final TextInputType inputType;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.verticalPadding,
      child: TextFormField(
        validator: validator,
        controller: controller,
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
