import 'package:ask2movie/customs/images/image_with_icon_button.dart';
import 'package:ask2movie/customs/indicators/custom_rating_bar_indicator.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/screens/movie_detail_view.dart';
import 'package:ask2movie/utility/mixins/navigation_wrapper_mixin.dart';
import 'package:flutter/material.dart';

class CustomTopFiveCard extends StatelessWidget
    with NavigationWrapperMixinStateless {
  const CustomTopFiveCard({
    required this.movie,
    super.key,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(
          context,
          MovieDetailView(
            movie: movie,
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 230,
            child: ImageWithIconButton(
              movie: movie,
            ),
          ),
          SubTitleWidget.m1(
            title: movie.name ?? '',
          ),
          Row(
            children: [
              SubTitleWidget.m1(
                title: movie.rate.toString(),
              ),
              CustomRatingBarIndicator(movie: movie),
            ],
          ),
        ],
      ),
    );
  }
}
