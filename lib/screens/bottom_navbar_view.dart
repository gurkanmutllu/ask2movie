import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/screens/home_view.dart';
import 'package:ask2movie/screens/movie_detail_view.dart';
import 'package:ask2movie/screens/search_view.dart';
import 'package:ask2movie/screens/settings_view.dart';
import 'package:ask2movie/services/movie_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    final movieService = MovieService.instance;

    _widgetOptions = <Widget>[
      HomeView(movie: movieService.fetch()),
      const SettingsView(),
      MovieDetailView(movie: movieService.fetch()),
      const SearchView(),
    ];
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
            icon: const Icon(Icons.settings_outlined),
            label: LocaleKeys.base_settings.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            label: LocaleKeys.base_search.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark_border_outlined),
            label: LocaleKeys.base_bookmarks.tr(),
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
