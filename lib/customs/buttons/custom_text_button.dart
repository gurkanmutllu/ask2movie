import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton.m1({
    required this.onPressed,
    required this.title,
    super.key,
  })  : mainAxisAlignment = MainAxisAlignment.spaceBetween,
        textFontSize = 15.0;

  const CustomTextButton.m2({
    required this.title,
    required this.onPressed,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.textFontSize = 15.0,
  });

  final VoidCallback onPressed;
  final String title;
  final MainAxisAlignment mainAxisAlignment;
  final double textFontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.halfTopPadding,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: textFontSize,
              ),
            ),
            const Icon(
              Icons.chevron_right_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
