import 'border_items.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonWithIcon extends StatelessWidget {
  const CustomElevatedButtonWithIcon({
    super.key,
    required this.buttonText,
    required this.buttonIcon,
  });

  final String buttonText;
  final IconData buttonIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        label: Text(buttonText),
        onPressed: () {},
        icon: Icon(buttonIcon),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, foregroundColor: Colors.black, shape: BorderItems.roundedRectangleBorder),
      ),
    );
  }
}
