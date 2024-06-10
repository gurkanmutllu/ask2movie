import 'dart:io';

import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:ask2movie/services/database_service.dart';
import 'package:ask2movie/services/user_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
    required File? profilePhoto,
    required GlobalKey<FormState> key,
    required String dialogMessage,
    required String snackbarMessage,
  }) async {
    if (!(key.currentState?.validate() ?? false)) {
      return false;
    }
    final userCheckResult = await _userService.checkUserInfo(userName, email);
    final emailValidateResult = EmailValidator.validate(email);
    if (userCheckResult) {
      final result = await _authService.createUserWithEmail(
        email: email,
        password: password,
      );
      if (result != null) {
        final uid = await _authService.getCurrentUid();
        if (profilePhoto == null) {
          if (!mounted) return false;
          ScaffoldMessenger.of(context)
              .showSnackBar(showSnackBarFun('Please select a profile photo'));
          return false;
        } else {
          final tempImageUrl =
              await DatabaseService().uploadImageToTemp(profilePhoto);

          final profilePhotoUrl =
              await DatabaseService().moveImageToUserFolder(tempImageUrl, uid);
          final user = User(
            userName: userName,
            emailAddress: email,
            password: password,
            profilePhotoUrl: profilePhotoUrl,
            id: uid,
          );
          await _userService.addUser(uid, user);
        }
        return true;
      }
    } else if (emailValidateResult == false) {
      if (!mounted) return false;
      ScaffoldMessenger.of(context)
          .showSnackBar(showSnackBarFun(snackbarMessage));
      return false;
    } else {
      if (!mounted) return false;
      ScaffoldMessenger.of(context)
          .showSnackBar(showSnackBarFun(dialogMessage));
      return false;
    }
    if (!mounted) return false;
    ScaffoldMessenger.of(context)
        .showSnackBar(showSnackBarFun(snackbarMessage));
    return false;
  }

  SnackBar showSnackBarFun(String message) {
    return SnackBar(
      content: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.amber,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 150,
        left: 10,
        right: 10,
      ),
    );
  }
}

class CustomScaffoldMessenger extends StatelessWidget {
  const CustomScaffoldMessenger({required this.message, super.key});
  final String message;
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.amber,
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10,
        ),
      ),
    );
  }
}
