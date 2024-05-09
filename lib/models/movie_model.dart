// ignore_for_file: lines_longer_than_80_chars

class Movie {
  Movie(
    this.name,
    this.rate,
    this.imagUrl,
    this.genre,
    this.description, {
    this.isBookmarked = false,
  });

  final String name;
  final double rate;
  final String imagUrl;
  final String genre;
  final String description;
  final bool isBookmarked;
}
