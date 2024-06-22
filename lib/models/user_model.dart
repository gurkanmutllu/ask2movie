import 'package:ask2movie/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User extends Equatable with IdModel, BaseFirebaseModel<User> {
  User({
    this.emailAddress,
    this.password,
    this.profilePhotoUrl,
    this.userName,
    this.id,
  });

  factory User.fromCredential(UserCredential credential) => User(
        emailAddress: credential.user?.email,
        profilePhotoUrl: credential.user?.photoURL,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String? emailAddress;
  final String? password;
  final String? profilePhotoUrl;
  final String? userName;
  @override
  final String? id;

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props =>
      [emailAddress, password, profilePhotoUrl, userName, id];

  User copyWith({
    String? emailAddress,
    String? password,
    String? profilePhotoUrl,
    String? userName,
    String? id,
  }) {
    return User(
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      userName: userName ?? this.userName,
      id: id ?? this.id,
    );
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }
}
