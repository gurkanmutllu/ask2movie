import '../core/init/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'padding_items.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.inputType,
  });

  final String labelText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.verticalPadding,
      child: TextField(
        obscureText: isPassword(labelText),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        keyboardType: inputType,
      ),
    );
  }
}

bool isPassword(String labelText) {
  if (labelText == LocaleKeys.base_password.tr()) {
    return true;
  } else {
    return false;
  }
}
