// ignore_for_file: lines_longer_than_80_chars

import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/cards/movie_info_column.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/screens/movie_detail_view.dart';
import 'package:ask2movie/utility/mixins/navigation_wrapper_mixin.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSliverListContainer extends StatelessWidget
    with NavigationWrapperMixinStateless {
  const CustomSliverListContainer({
    required this.movie,
    super.key,
  });

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.allPadding,
      child: InkWell(
        onTap: () {
          pushTo(context, MovieDetailView(movie: movie));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ImageWithIconButton(movie),
            ),
            Expanded(
              child: Padding(
                padding: PaddingItems.leftPadding,
                child: MovieInfoColumn(
                  movie: movie,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageWithIconButton extends StatelessWidget {
  const _ImageWithIconButton(this.movie);

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CachedNetworkImage(
          imageUrl: movie.imageUrl ?? '',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            height: 300,
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
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
