import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/bookmark_button.dart';
import 'package:ask2movie/customs/indicators/custom_rating_bar_indicator.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({required this.movie, super.key});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          BookmarkButton(movie: movie),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: movie.imageUrl ?? '',
              imageBuilder: (context, imageProvider) => Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: PaddingItems.movieInfoColumnDetailViewPadding,
              child: _MovieInfoColumnDetailView(movie),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieInfoColumnDetailView extends StatelessWidget {
  const _MovieInfoColumnDetailView(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget.m2(
          title: movie.name ?? '',
          textMaxline: 2,
        ),
        Padding(
          padding: PaddingItems.verticalPadding,
          child: Row(
            children: [
              SubTitleWidget.m1(title: movie.rate.toString()),
              CustomRatingBarIndicator(
                movie: movie,
                itemSize: 15,
              ),
            ],
          ),
        ),
        Text(
          movie.genre ?? '',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: PaddingItems.verticalPadding,
          child: ReadMoreText(
            movie.description ?? '',
            colorClickableText: Colors.amber,
          ),
        ),
      ],
    );
  }
}
