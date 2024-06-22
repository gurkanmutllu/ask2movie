// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialogue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dialogue _$DialogueFromJson(Map<String, dynamic> json) => Dialogue(
      id: json['id'] as String?,
      dialogues: (json['dialogues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DialogueToJson(Dialogue instance) => <String, dynamic>{
      'id': instance.id,
      'dialogues': instance.dialogues,
    };
