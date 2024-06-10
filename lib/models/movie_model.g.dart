// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      genre: json['genre'] as String?,
      imageUrl: json['imageUrl'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'genre': instance.genre,
      'imageUrl': instance.imageUrl,
      'rate': instance.rate,
    };
