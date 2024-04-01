// ignore_for_file: lines_longer_than_80_chars

import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:flutter/material.dart';

class CustomSliverListContainer extends StatelessWidget {
  const CustomSliverListContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.allPadding,
      child: GestureDetector(
        onTap: () {},
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _PhotoWithIconButton(),
            ),
            Expanded(
              child: Padding(
                padding: PaddingItems.leftPadding,
                child: _MovieInfoColumn(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieInfoColumn extends StatelessWidget {
  const _MovieInfoColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SubTitleWidget.m2(
          title: "Hitman's Wife's BodyGuard",
          textMaxline: 2,
        ),
        Row(
          children: [
            SubTitleWidget.m1(title: '3.5 '),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_half_outlined),
            Icon(Icons.star_border_outlined),
          ],
        ),
        Text(
          'Action, Comedy, Crime',
        ),
        Text(
          "The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia.",
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _PhotoWithIconButton extends StatelessWidget {
  const _PhotoWithIconButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                'https://m.media-amazon.com/images/M/MV5BNDkzYmNiOWYtNzZkNi00NzNiLTk2MzktY2VmMGY4MmI1NDMwXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 300,
        ),
        IconButton(
          color: Colors.amber,
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_outlined,
            size: 30,
          ),
        ),
      ],
    );
  }
}
