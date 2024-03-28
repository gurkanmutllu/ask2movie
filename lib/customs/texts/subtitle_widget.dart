import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({required this.title, super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: PaddingItems.rightPadding,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
