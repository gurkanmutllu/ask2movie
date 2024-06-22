import 'package:ask2movie/screens/login_view.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin LoginViewMixin on State<LoginView> {
  final AuthService _authService = AuthService.instance;

  Future<bool> login({
    required String email,
    required String password,
    required GlobalKey<FormState> key,
  }) async {
    if (!(key.currentState?.validate() ?? false)) {
      return false;
    }
    final result = await _authService.loginWithEmail(
      email: email,
      password: password,
    );
    if (result != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> googleLogin() async {
    await _authService.googleSignIn();
    return true;
  }
}
