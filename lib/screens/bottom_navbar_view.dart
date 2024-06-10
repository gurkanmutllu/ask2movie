import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/screens/bookmarks_view.dart';
import 'package:ask2movie/screens/home_view.dart';
import 'package:ask2movie/screens/mixins/bottom_navbar_mixin.dart';
import 'package:ask2movie/screens/search_view.dart';
import 'package:ask2movie/screens/settings_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with BottomNavbarMixin {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  late List<Movie> _movies;

  @override
  void initState() {
    super.initState();
    _movies = [];
    _widgetOptions = <Widget>[
      const Center(
        child: CircularProgressIndicator(),
      ),
      const SearchView(),
      const Center(
        child: CircularProgressIndicator(),
      ),
      const SettingsView(),
    ];
    _loadMovie();
  }

  Future<void> _loadMovie() async {
    final movies = await getMovies();
    setState(() {
      _movies = movies;
      _widgetOptions = <Widget>[
        HomeView(movies: _movies),
        const SearchView(),
        BookmarksView(movies: _movies),
        const SettingsView(),
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: LocaleKeys.base_home.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            label: LocaleKeys.base_search.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark_border_outlined),
            label: LocaleKeys.base_bookmarks.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: LocaleKeys.base_settings.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
