import 'package:ask2movie/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie extends Equatable with IdModel, BaseFirebaseModel<Movie> {
  Movie({
    this.id,
    this.name,
    this.description,
    this.genre,
    this.imageUrl,
    this.rate,
  });

  // factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  final String? id;
  final String? name;
  final String? description;
  final String? genre;
  final String? imageUrl;
  final double? rate;

  @override
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [id, name, description, genre, imageUrl, rate];

  Movie copyWith({
    String? id,
    String? name,
    String? description,
    String? genre,
    String? imageUrl,
    double? rate,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      imageUrl: imageUrl ?? this.imageUrl,
      rate: rate ?? this.rate,
    );
  }

  @override
  Movie fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }
}
