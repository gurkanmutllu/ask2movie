import 'package:ask2movie/models/movie_model.dart';

class MovieService {
  MovieService._init();
  static final MovieService _instance = MovieService._init();
  static MovieService get instance => _instance;

  Movie fetch() {
    return Movie(
      "Hitman's wife's Bodyguard",
      3.5,
      'https://m.media-amazon.com/images/M/MV5BNDkzYmNiOWYtNzZkNi00NzNiLTk2MzktY2VmMGY4MmI1NDMwXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg',
      'Action, Comedy, Crime',
      // ignore: lines_longer_than_80_chars
      "The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia.",
    );
  }
}
