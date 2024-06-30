import 'dart:developer';

import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/services/movie_service.dart';
import 'package:flutter/material.dart';

mixin MovieViewMixin<T extends StatefulWidget> on State<T> {
  final _movieService = MovieService.instance;

  Future<List<Movie>> getTopFive() async {
    final topFiveMovies = await _movieService.topFiveMovies();
    return topFiveMovies ?? [];
  }

  Future<List<Movie>?> filterMoviesByName() async {
    final movies = await _movieService.filterMoviesByName();
    return movies;
  }

  Future<List<Movie>?> filterMoviesByRate() async {
    final movies = await _movieService.filterMoviesByRate();
    return movies;
  }

  bool saveMovieToCache(Movie movie) {
    try {
      _movieService.saveMovieToCache(movie);
      log('movie cached');
      return true;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  bool deleteMovieFromCache(String id) {
    try {
      _movieService.deleteMovieFromCache(id);
      return true;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  Movie? getMovieFromCache(String id) {
    try {
      return _movieService.getMovieFromCache(id);
    } catch (e) {
      Exception(e);
      return null;
    }
  }

  List<Movie> getCachedMovies() {
    return _movieService.getCachedMovies();
  }
}

mixin MovieViewMixinStateless on StatelessWidget {
  final _movieService = MovieService.instance;

  bool saveMovieToCache(Movie movie) {
    try {
      _movieService.saveMovieToCache(movie);
      log('movie cached');
      return true;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  bool deleteMovieFromCache(String id) {
    try {
      _movieService.deleteMovieFromCache(id);
      return true;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  Movie? getMovieFromCache(String id) {
    try {
      return _movieService.getMovieFromCache(id);
    } catch (e) {
      Exception(e);
      return null;
    }
  }

  List<Movie> getCachedMovies() {
    return _movieService.getCachedMovies();
  }
}
