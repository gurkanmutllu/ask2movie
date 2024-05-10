// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      genre: json['genre'] as String?,
      description: json['description'] as String?,
      isBookmarked: json['isBookmarked'] as bool? ?? false,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'imageUrl': instance.imageUrl,
      'genre': instance.genre,
      'description': instance.description,
      'isBookmarked': instance.isBookmarked,
    };
