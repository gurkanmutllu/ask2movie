// ignore_for_file: lines_longer_than_80_chars

import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/cards/movie_info_column.dart';
import 'package:ask2movie/customs/images/image_with_icon_button.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/screens/movie_detail_view.dart';
import 'package:ask2movie/utility/mixins/navigation_wrapper_mixin.dart';
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
              child: ImageWithIconButton(
                movie: movie,
              ),
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
