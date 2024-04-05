import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomTopFiveCard extends StatelessWidget {
  const CustomTopFiveCard({required this.movie, super.key});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 230,
            child: _ImageWithIconButton(movie),
          ),
          SubTitleWidget.m1(
            title: movie.name,
          ),
          Row(
            children: [
              SubTitleWidget.m1(
                title: movie.rate.toString(),
              ),
              RatingBarIndicator(
                rating: movie.rate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 25,
              ),
            ],
          ),
        ],
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
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              movie.imagUrl,
              fit: BoxFit.cover,
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
