import 'package:ask2movie/models/movie_model.dart';
import 'package:ask2movie/product/cache/model/movie_cache_model.dart';
import 'package:ask2movie/product/cache/product_cache.dart';
import 'package:ask2movie/providers/fire_store_provider.dart';

class MovieService {
  MovieService._init();
  static final MovieService _instance = MovieService._init();
  static MovieService get instance => _instance;

  final _fireStoreProvider = FireStoreProvider.instance;
  final _productCache = ProductCache.instance;

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
      final movies = await getMovies();
      if (movies == null) return null;
      for (var movie in movies) {
        if (movie.id == id) {
          return movie;
        }
      }
    } catch (e) {
      Exception(e);
    }
    return null;
  }

  Future<List<Movie>?> filterMoviesByRate() async {
    final movies = await getMovies();
    if (movies == null) return null;

    movies.sort((a, b) => a.rate!.compareTo(b.rate!));
    final sortedMovies = movies.reversed.toList();
    return sortedMovies;
  }

  Future<List<Movie>?> topFiveMovies() async {
    final movies = await getMovies();
    if (movies == null) return null;

    movies.sort((a, b) => a.rate!.compareTo(b.rate!));
    final sortedMovies = movies.reversed.toList();
    return sortedMovies.take(5).toList();
  }

  Future<List<Movie>?> filterMoviesByName() async {
    final movies = await getMovies();
    if (movies == null) return null;

    movies.sort((a, b) => a.name!.compareTo(b.name!));
    return movies;
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
