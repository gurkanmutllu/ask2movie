import 'package:ask2movie/customs/indicators/custom_rating_bar_indicator.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieInfoColumn extends StatelessWidget {
  const MovieInfoColumn({required this.movie, super.key});

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
        Row(
          children: [
            SubTitleWidget.m1(title: movie.rate.toString()),
            CustomRatingBarIndicator(movie: movie),
          ],
        ),
        Text(
          movie.genre ?? '',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          movie.description ?? '',
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
