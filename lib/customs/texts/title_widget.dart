import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.title,
    super.key,
    this.padding = PaddingItems.bottomPadding,
  });

  final String title;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(color: Colors.amber, fontWeight: FontWeight.w900),
      ),
    );
  }
}
