// ignore_for_file: lines_longer_than_80_chars

class Movie {
  Movie(this.name, this.rate, this.imagUrl, this.description);

  final String name;
  final double rate;
  final String imagUrl;
  final String description;

  static List<Movie> fetchAll() {
    return [
      Movie(
        "Hitman's Wife's BodyGuard",
        3.5,
        'https://m.media-amazon.com/images/M/MV5BNDkzYmNiOWYtNzZkNi00NzNiLTk2MzktY2VmMGY4MmI1NDMwXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg',
        "The bodyguard, Michael Bryce, continues his friendship with assassin, Darius Kincaid, as they try to save Darius' wife Sonia.",
      ),
    ];
  }
}
