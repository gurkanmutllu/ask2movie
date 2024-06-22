import 'package:ask2movie/models/movie_model.dart';
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kartal/kartal.dart';

part 'movie_cache_model.g.dart';

@JsonSerializable()
final class MovieCacheModel with CacheModel {
  MovieCacheModel({required this.movie, required this.isBookmarked});
  MovieCacheModel.empty()
      : movie = Movie(),
        isBookmarked = false;
  final Movie movie;

  @override
  MovieCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<Movie>('Json cannot be null');
      return this;
    }
    return fromJson(json!);
  }

  @override
  String get id => movie.id.toString();
  final bool isBookmarked;

  @override
  Map<String, dynamic> toJson() => _$MovieCacheModelToJson(this);

  MovieCacheModel copyWith({
    Movie? movie,
  }) {
    return MovieCacheModel(
      movie: movie ?? this.movie,
      isBookmarked: isBookmarked,
    );
  }

  MovieCacheModel fromJson(Map<String, dynamic> json) {
    return _$MovieCacheModelFromJson(json);
  }
}
