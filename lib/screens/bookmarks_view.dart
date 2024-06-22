import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/containers/custom_sliver_list_container.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/services/movie_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookmarksView extends StatelessWidget {
  BookmarksView({super.key});
  final _movieService = MovieService.instance;

  @override
  Widget build(BuildContext context) {
    final movies = _movieService.getCachedMovies();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: PaddingItems.topPadding,
          child: TitleWidget(title: LocaleKeys.bookmarks_bookmarksTitle.tr()),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomSliverListContainer(
                movie: movies.elementAt(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
