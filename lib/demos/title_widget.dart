import 'package:flutter/material.dart';

import 'padding_items.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: PaddingItems.bottomPadding,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.amber, fontWeight: FontWeight.w900),
      ),
    );
  }
}
