import 'package:ask2movie/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dialogue_model.g.dart';

@JsonSerializable()
class Dialogue extends Equatable with IdModel, BaseFirebaseModel<Dialogue> {
  Dialogue({
    this.id,
    this.dialogues,
  });

  @override
  final String? id;
  final List<String>? dialogues;

  @override
  Map<String, dynamic> toJson() => _$DialogueToJson(this);

  @override
  List<Object?> get props => [id, dialogues];

  Dialogue copyWith({
    String? id,
    List<String>? dialogues,
  }) {
    return Dialogue(
      id: id ?? this.id,
      dialogues: dialogues ?? this.dialogues,
    );
  }

  @override
  Dialogue fromJson(Map<String, dynamic> json) {
    return _$DialogueFromJson(json);
  }
}
