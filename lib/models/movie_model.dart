import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  Movie({
    this.id = 0,
    this.name,
    this.rate,
    this.imageUrl,
    this.genre,
    this.description,
    this.isBookmarked = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  final int id;
  final String? name;
  final double? rate;
  final String? imageUrl;
  final String? genre;
  final String? description;
  final bool? isBookmarked;
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
