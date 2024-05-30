// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      emailAddress: json['emailAddress'] as String?,
      password: json['password'] as String?,
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      userName: json['userName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'userName': instance.userName,
      'id': instance.id,
    };
