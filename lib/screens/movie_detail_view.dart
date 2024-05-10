import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({required this.movie, super.key});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left_outlined),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_outlined),
          ),
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
              RatingBarIndicator(
                rating: movie.rate ?? 0,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 25,
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
            movie.description ?? '' * 5,
            colorClickableText: Colors.amber,
          ),
        ),
      ],
    );
  }
}