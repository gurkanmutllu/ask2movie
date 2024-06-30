import 'dart:io';

import 'package:ask2movie/customs/snackbar/show_snackbar.dart';
import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/screens/sign_in_view.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:ask2movie/services/database_service.dart';
import 'package:ask2movie/services/user_service.dart';
import 'package:flutter/material.dart';

mixin SignInViewMixin<T extends StatefulWidget> on State<SignInView> {
  final AuthService _authService = AuthService.instance;
  final UserService _userService = UserService.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();
  late File? selectedImage;

  Future<bool> addGoogleUser() async {
    try {
      final result = await _authService.googleSignIn();
      final uid = await _authService.getCurrentUid();

      if (result != null) {
        final user = User(
          userName: result.user?.displayName,
          emailAddress: result.user?.email,
          password: '',
          profilePhotoUrl: result.user?.photoURL,
          id: uid,
        );
        await _userService.addUser(uid, user);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  Future<bool> addUser() async {
    if (!(key.currentState?.validate() ?? false)) return false;
    if (selectedImage == null) {
      if (!mounted) return false;
      showSnackBarFun(context, 'Please select an image');
      return false;
    }
    try {
      final result = await _authService.createUserWithEmail(
        email: emailController.text,
        password: passwordController.text,
      );
      if (result == null) {
        if (!mounted) return false;
        showSnackBarFun(context, 'Email is already in use');
        return false;
      }

      final uid = await _authService.getCurrentUid();

      final tempImageUrl =
          await DatabaseService().uploadImageToTemp(selectedImage!);
      final profilePhotoUrl =
          await DatabaseService().moveImageToUserFolder(tempImageUrl, uid);
      final user = User(
        userName: userNameController.text,
        emailAddress: emailController.text,
        password: passwordController.text,
        profilePhotoUrl: profilePhotoUrl,
        id: uid,
      );
      await _userService.addUser(uid, user);
      return true;
    } catch (e) {
      Exception(e);
      return false;
    }
  }
}
