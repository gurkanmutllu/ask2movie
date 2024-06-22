import 'package:ask2movie/customs/buttons/bookmark_button.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWithIconButton extends StatelessWidget {
  const ImageWithIconButton({
    required this.movie,
    this.width = 300,
    this.height = 300,
    super.key,
  });

  final Movie movie;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: movie.imageUrl ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BookmarkButton(movie: movie),
      ],
    );
  }
}
