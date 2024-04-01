import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget.m1({
    required this.title,
    super.key,
  })  : textColor = Colors.white,
        textFontWeight = FontWeight.w500,
        textMaxline = 1;

  const SubTitleWidget.m2({
    required this.title,
    super.key,
    this.textColor = Colors.white,
    this.textFontWeight = FontWeight.w500,
    this.textMaxline = 1,
  });

  final String title;
  final Color textColor;
  final FontWeight textFontWeight;
  final int textMaxline;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: textMaxline,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: textColor, fontWeight: textFontWeight),
    );
  }
}
