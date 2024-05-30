import 'dart:developer';

import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:ask2movie/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin SignInViewMixin<T extends StatefulWidget> on State<T> {
  final AuthService _authService = AuthService.instance;
  final UserService _userService = UserService.instance;

  Future<void> signIn({
    required String email,
    required String password,
    required GlobalKey<FormState> key,
  }) async {
    if (!(key.currentState?.validate() ?? false)) {
      return;
    }
    final result = await _authService.createUserWithEmail(
      email: email,
      password: password,
    );
    if (result == null) return;
  }

  Future<bool> addUser({
    required String userName,
    required String email,
    required String password,
    required String profilePhotoUrl,
    required GlobalKey<FormState> key,
  }) async {
    final user = User(
      userName: userName,
      emailAddress: email,
      password: password,
      profilePhotoUrl: profilePhotoUrl,
    );
    if (!(key.currentState?.validate() ?? false)) {
      return false;
    }
    final userCheckResult = await _userService.checkUserInfo(userName);
    if (userCheckResult) {
      final result = await _authService.createUserWithEmail(
        email: email,
        password: password,
      );
      if (result != null) {
        await _userService.addUser(user, result);
        return true;
      } else {
        log('email address is already in use');
        return false;
      }
    }
    return false;
  }
}
