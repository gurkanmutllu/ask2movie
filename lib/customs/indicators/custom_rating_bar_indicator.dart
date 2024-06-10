import 'package:ask2movie/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator({
    required this.movie,
    super.key,
    this.itemSize = 10,
  });

  final Movie movie;
  final double itemSize;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: movie.rate ?? 0,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 10,
      itemSize: itemSize,
    );
  }
}
