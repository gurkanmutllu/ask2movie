import 'package:ask2movie/models/movie_model.dart';

class MovieService {
  MovieService._init();
  static final MovieService _instance = MovieService._init();
  static MovieService get instance => _instance;

  Movie fetch() {
    return Movie(
      id: 1,
      name: "Hitman's wife's Bodyguard",
      rate: 3.5,
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BNDkzYmNiOWYtNzZkNi00NzNiLTk2MzktY2VmMGY4MmI1NDMwXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg',
      genre: 'Action, Comedy, Crime',
      description:
          // ignore: lines_longer_than_80_chars
          "The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia. The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia. The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia. The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia. The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia. The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia.",
    );
  }
}
