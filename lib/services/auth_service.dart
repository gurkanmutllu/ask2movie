import 'dart:developer';

import 'package:ask2movie/providers/auth/auth_service_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth_user;

class AuthService {
  AuthService._init();
  static final AuthService _instance = AuthService._init();
  static AuthService get instance => _instance;
  final _authProvider = AuthServiceProvider.instance;

  Future<auth_user.UserCredential?> loginWithEmail({
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

  Future<void> signOut() async {
    await _authProvider.signOut();
    log('log out !!!');
    return;
  }

  Future<auth_user.UserCredential?> createUserWithEmail({
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

  Future<String> getCurrentUid() async {
    final currentUser = await _authProvider.getCurrentUser();
    return currentUser?.uid ?? '';
  }
}
