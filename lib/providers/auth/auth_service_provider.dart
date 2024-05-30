import 'dart:developer';

import 'package:ask2movie/providers/auth/auth_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceProvider {
  AuthServiceProvider._init();
  static final AuthServiceProvider _instance = AuthServiceProvider._init();
  static AuthServiceProvider get instance => _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthResult<UserCredential, FirebaseAuthException>> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult<UserCredential, FirebaseAuthException>(
        data: cred,
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult<UserCredential, FirebaseAuthException>(
        exception: e,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      return;
    } catch (e) {
      log(e.toString());
      return;
    }
  }

  Future<AuthResult<UserCredential, FirebaseAuthException>> createUserWithEmail(
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult<UserCredential, FirebaseAuthException>(
        data: cred,
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult<UserCredential, FirebaseAuthException>(
        exception: e,
      );
    }
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }
}
