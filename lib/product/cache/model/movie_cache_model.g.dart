// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCacheModel _$MovieCacheModelFromJson(Map<String, dynamic> json) =>
    MovieCacheModel(
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      isBookmarked: json['isBookmarked'] as bool,
    );

Map<String, dynamic> _$MovieCacheModelToJson(MovieCacheModel instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'isBookmarked': instance.isBookmarked,
    };
