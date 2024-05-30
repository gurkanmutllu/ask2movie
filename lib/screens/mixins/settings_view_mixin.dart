import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:ask2movie/services/user_service.dart';
import 'package:flutter/material.dart';

mixin SettingsViewMixin<T extends StatefulWidget> on State<T> {
  final _userService = UserService.instance;
  final _authService = AuthService.instance;

  Future<User?> getCurrentUser() async {
    final uid = await _authService.getCurrentUid();
    return _userService.getUserById(uid);
  }

  Future<void> updateUser(User user) async {
    final uid = await _authService.getCurrentUid();
    return _userService.updateUser(uid, user);
  }
}

mixin SettingsViewMixinStateless on StatelessWidget {
  final _userService = UserService.instance;
  final _authService = AuthService.instance;

  Future<void> updateUser(User user) async {
    final uid = await _authService.getCurrentUid();
    return _userService.updateUser(uid, user);
  }
}
