import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/containers/custom_sliver_list_container.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/models/search_dialogue_model.dart';
import 'package:ask2movie/screens/mixins/search_view_mixin.dart';
import 'package:ask2movie/services/movie_service.dart';
import 'package:ask2movie/services/search_service.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with SearchViewMixin {
  late final TextEditingController _searchController;
  late final SearchService _searchService;
  late final MovieService _movieService;
  late List<SearchDialogue?> result = [];
  late List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchService = SearchService.instance;
    _movieService = MovieService.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      appBar: AppBar(
        title: const Center(child: TitleWidget(title: 'Search.')),
      ),
      body: Column(
        children: [
          Padding(
            padding: PaddingItems.textFieldPadding,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    label: Center(child: Text('Search')),
                  ),
                  controller: _searchController,
                ),
                TextButton(
                  child: const Text('Search'),
                  onPressed: () async {
                    final searchResult =
                        await _searchService.search(_searchController.text);
                    final searchMovies = <Movie>[];
                    for (final dialogue in searchResult) {
                      if (dialogue != null) {
                        final movie =
                            await _movieService.getMovieById(dialogue.id);
                        if (movie != null) {
                          searchMovies.add(movie);
                        }
                      }
                    }
                    setState(() {
                      result = searchResult;
                      movies = searchMovies;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                final dialogue = result[index];
                final movie = movies[index];
                return Column(
                  children: [
                    SubTitleWidget.m2(
                      title: 'Result:  ${dialogue?.dialogueText ?? ''}',
                      textMaxline: 3,
                      textFontWeight: FontWeight.normal,
                    ),
                    CustomSliverListContainer(movie: movie),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
