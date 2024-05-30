import 'package:ask2movie/core/project_items/border_items.dart';
import 'package:flutter/material.dart';

enum ButtonType { icon, nonIcon }

final class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    super.key,
  })  : _type = ButtonType.nonIcon,
        buttonIcon = null;

  const CustomElevatedButton.icon({
    required this.buttonText,
    required this.buttonIcon,
    required this.onPressed,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    super.key,
  }) : _type = ButtonType.icon;

  final ButtonType _type;
  final IconData? buttonIcon;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: switch (_type) {
        ButtonType.icon => ElevatedButton.icon(
            label: Text(buttonText),
            onPressed: onPressed,
            icon: Icon(buttonIcon),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: BorderItems.roundedRectangleBorder,
            ),
          ),
        ButtonType.nonIcon => ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: BorderItems.roundedRectangleBorderSide,
            ),
            child: Text(
              buttonText,
              style: TextStyle(color: textColor),
            ),
          ),
      },
    );
  }
}
