import 'package:ask2movie/models/user_model.dart';
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kartal/kartal.dart';

part 'user_cache_model.g.dart';

@JsonSerializable()
final class UserCacheModel with CacheModel {
  UserCacheModel({required this.user});

  UserCacheModel.empty() : user = User();
  final User user;

  @override
  CacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<User>('Json cannot be null.');
      return this;
    }
    return fromJson(json!);
  }

  @override
  String get id => user.id.toString();

  @override
  Map<String, dynamic> toJson() => _$UserCacheModelToJson(this);

  UserCacheModel copyWith({User? user}) {
    return UserCacheModel(user: user ?? this.user);
  }

  UserCacheModel fromJson(Map<String, dynamic> json) {
    return _$UserCacheModelFromJson(json);
  }
}
