import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/screens/login_view.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:ask2movie/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

mixin LoginViewMixin on State<LoginView> {
  final AuthService _authService = AuthService.instance;
  final UserService _userService = UserService.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  Future<bool> login() async {
    if (!(key.currentState?.validate() ?? false)) return false;
    final result = await _authService.loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
    );
    if (result != null) return true;

    return false;
  }

  Future<bool> googleLogin() async {
    try {
      final googleUser = await _authService.googleLogin();
      if (googleUser != null) {
        final user = googleUser.user;
        if (user == null) return false;
        final firestoreUser = await _userService.getUserById(user.uid);
        if (firestoreUser != null) {
          final uid = firestoreUser.id;
          _userService.updateUser(uid!, firestoreUser);
          return true;
        }
        final newUser = User(
          id: user.uid,
          userName: user.displayName,
          emailAddress: user.email,
          profilePhotoUrl: user.photoURL,
        );
        _userService.addUser(user.uid, newUser);
        return true;
      }
      return false;
    } catch (e) {
      Exception(e);
      return false;
    }
  }
}
