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
          textAlign: TextAlign.start,
        ),
        Text(
          'Text about this movie.',
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
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
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
