import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/screens/bottom_navbar_view.dart';
import 'package:ask2movie/services/movie_service.dart';
import 'package:flutter/material.dart';

mixin BottomNavbarMixin on State<BottomNavBar> {
  final _movieService = MovieService.instance;

  Future<Movie?> getMovieByName(String name) async {
    final movie = await _movieService.getMovieByName(name);
    return movie;
  }
}
