import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_dropdown_button.dart';
import 'package:ask2movie/customs/cards/custom_top_five_card.dart';
import 'package:ask2movie/customs/containers/custom_sliver_list_container.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/screens/mixins/movie_view_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({required this.movies, super.key});
  final List<Movie> movies;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with MovieViewMixin {
  late List<Movie> _movies;
  List<Movie> _topFiveMovies = [];
  @override
  void initState() {
    super.initState();
    _movies = widget.movies;
    _loadTopFive();
  }

  Future<void> _loadTopFive() async {
    final topFive = await getTopFive();
    setState(() {
      _topFiveMovies = topFive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: PaddingItems.topPadding,
          child: TitleWidget(title: LocaleKeys.home_homeTitle.tr()),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: PaddingItems.zeroPadding,
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: PaddingItems.horizontalPadding,
                child: SizedBox(
                  height: 400,
                  child: _topFiveMovies.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            TitleWidget(title: LocaleKeys.home_topFive.tr()),
                            Expanded(
                              child: ListView.builder(
                                itemCount: _topFiveMovies.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  final movie = _topFiveMovies.elementAt(index);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: SizedBox(
                                      width: 300,
                                      child: CustomTopFiveCard(movie: movie),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: PaddingItems.horizontalPadding,
              child: Row(
                children: [
                  Expanded(
                    child: TitleWidget(
                      title: LocaleKeys.home_latest.tr(),
                      padding: PaddingItems.zeroPadding,
                    ),
                  ),
                  Padding(
                    padding: PaddingItems.horizontalPadding,
                    child: CustomDropdownButton(
                      onChangedMovies: (value) {
                        setState(() {
                          _movies = value ?? _movies;
                        });
                      },
                      movies: _movies,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: _movies.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomSliverListContainer(
                movie: _movies.elementAt(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
