import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomTopFiveCard extends StatelessWidget {
  const CustomTopFiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    const rating = 3.5;
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 230,
            child: _ImageWithIconButton(),
          ),
          const SubTitleWidget.m1(
            title: 'Trying..............',
          ),
          Padding(
            padding: PaddingItems.horizontalPadding,
            child: Row(
              children: [
                const SubTitleWidget.m1(
                  title: '$rating ',
                ),
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemSize: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageWithIconButton extends StatelessWidget {
  const _ImageWithIconButton();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              'https://m.media-amazon.com/images/M/MV5BNDkzYmNiOWYtNzZkNi00NzNiLTk2MzktY2VmMGY4MmI1NDMwXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg',
              fit: BoxFit.fill,
            ),
          ),
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
