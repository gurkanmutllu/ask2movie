import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/product/cache/model/movie_cache_model.dart';
import 'package:ask2movie/product/cache/product_cache.dart';
import 'package:ask2movie/providers/fire_store_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieService {
  MovieService._init();
  static final MovieService _instance = MovieService._init();
  static MovieService get instance => _instance;

  final _fireStoreProvider = FireStoreProvider.instance;
  final _productCache = ProductCache.instance;

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
      Exception(e);
      return null;
    }
  }

  Future<Movie?> getMovieById(String id) async {
    try {
      final querySnapshot = await movies.where('id', isEqualTo: id).get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        final data = documentSnapshot.data()! as Map<String, dynamic>;
        return Movie.fromJson(data);
      }
    } catch (e) {
      Exception(e);
    }
    return null;
  }

  void saveMovieToCache(Movie movie) {
    _productCache.movieCacheOperation.add(
      MovieCacheModel(
        movie: movie,
        isBookmarked: true,
      ),
    );
  }

  List<Movie> getCachedMovies() {
    final cachedMovies = _productCache.movieCacheOperation.getAll();
    final movies = <Movie>[];
    for (final cachedMovie in cachedMovies) {
      movies.add(cachedMovie.movie);
    }
    return movies;
  }

  bool isFavorite(Movie movie) {
    if (movie.id == null) return false;
    final result = _productCache.movieCacheOperation.get(movie.id!);
    return result != null;
  }

  bool favorite(Movie movie) {
    try {
      final cacheModel = MovieCacheModel(movie: movie, isBookmarked: true);
      final result = _productCache.movieCacheOperation.add(cacheModel);
      return result;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  bool unFavorite(Movie movie) {
    if (movie.id == null) return false;
    return _productCache.movieCacheOperation.remove(movie.id!);
  }

  void deleteMovieFromCache(String id) {
    _productCache.movieCacheOperation.remove(id);
  }

  Movie? getMovieFromCache(String id) {
    final cachedMovie = _productCache.movieCacheOperation.get(id)?.movie;
    return cachedMovie;
  }
}
