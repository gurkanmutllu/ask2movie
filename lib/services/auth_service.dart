import 'dart:developer';

import 'package:ask2movie/models/user_model.dart' as user_model;
import 'package:ask2movie/providers/auth/auth_service_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._init();
  static final AuthService _instance = AuthService._init();
  static AuthService get instance => _instance;
  final _authProvider = AuthServiceProvider.instance;

  Future<UserCredential?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await _authProvider.loginWithEmail(
      email,
      password,
    );
    if (result.data != null) {
      return result.data;
    }
    return null;
  }

  Future<bool> resetPassword({
    required String email,
  }) async {
    try {
      await _authProvider.resetPassword(email);
      return true;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  Future<void> signOut() async {
    await _authProvider.signOut();
    log('log out !!!');
    return;
  }

  Future<UserCredential?> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await _authProvider.createUserWithEmail(
      email,
      password,
    );
    if (result.data != null) {
      return result.data;
    }
    return null;
  }

  Future<UserCredential?> googleLogin() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  Future<UserCredential?> updateUser({
    required String userId,
    required user_model.User user,
  }) async {
    final result = await _authProvider.getCurrentUser();
    if (result != null) {
      await result.verifyBeforeUpdateEmail(user.emailAddress ?? '');
      await result.updatePassword(user.password ?? '');
    }
    return null;
  }

  Future<String> getCurrentUid() async {
    final currentUser = await _authProvider.getCurrentUser();
    return currentUser?.uid ?? '';
  }
}
