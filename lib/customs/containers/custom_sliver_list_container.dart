// ignore_for_file: lines_longer_than_80_chars

import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/cards/movie_info_column.dart';
import 'package:ask2movie/models/movie_model.dart';
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
              child: _ImageWithIconButton(),
            ),
            Expanded(
              child: Padding(
                padding: PaddingItems.leftPadding,
                child: MovieInfoColumn(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageWithIconButton extends StatelessWidget {
  const _ImageWithIconButton();

  @override
  Widget build(BuildContext context) {
    final movies = Movie.fetchAll();
    final movie = movies.first;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                movie.imagUrl,
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
