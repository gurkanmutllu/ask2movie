import 'dart:developer';

import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/providers/fire_store_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieService {
  MovieService._init();
  static final MovieService _instance = MovieService._init();
  static MovieService get instance => _instance;

  final _fireStoreProvider = FireStoreProvider.instance;

  CollectionReference get movies =>
      FirebaseFirestore.instance.collection('movies');

  Future<List<Movie>?> getMovies() async {
    try {
      final result = await _fireStoreProvider.get(
        path: 'movies',
        model: Movie(),
      );
      return result;
    } catch (e) {
      log('Error getting movie');
      return null;
    }
  }

  Future<List<Movie>?> getTopFive() async {
    try {
      final result =
          await _fireStoreProvider.get(path: 'movies', model: Movie());
      final sorted = result.sort();
    } catch (e) {
      return null;
    }
    return null;
  }
}
