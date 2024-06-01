import 'package:ask2movie/models/movie_model.dart';
import 'package:core/core.dart';
import 'package:kartal/kartal.dart';

final class MovieCacheModel with CacheModel {
  MovieCacheModel({required this.movie});
  MovieCacheModel.empty() : movie = Movie();
  final Movie movie;

  @override
  MovieCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<Movie>('Json cannot be null');
      return this;
    }
    return copyWith(
      movie: Movie().fromJson(jsonMap),
    );
  }

  @override
  String get id => movie.id.toString();

  @override
  Map<String, dynamic> toJson() {
    return Movie().toJson();
  }

  MovieCacheModel copyWith({
    Movie? movie,
  }) {
    return MovieCacheModel(
      movie: movie ?? this.movie,
    );
  }
}
