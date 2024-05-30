import 'dart:developer';

import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/providers/fire_store_provider.dart';
import 'package:ask2movie/services/password_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth_user;

class UserService {
  UserService._init();
  static final UserService _instance = UserService._init();
  static UserService get instance => _instance;

  final _passwordService = PasswordService.instance;
  final _fireStoreProvider = FireStoreProvider.instance;

  CollectionReference get users =>
      FirebaseFirestore.instance.collection('users');

  Future<User?> getUserById(String userId) async {
    try {
      final userDoc = await users.doc(userId).get();
      if (userDoc.exists) {
        final data = userDoc.data();
        if (data != null && data is Map<String, dynamic>) {
          return const User().fromJson(data);
        }
      }
      return null;
    } catch (e) {
      log('Error getting user by ID: $e');
      return null;
    }
  }

  Future<void> addUser(User user, auth_user.UserCredential result) async {
    final emailQuery =
        await users.where('emailAddress', isEqualTo: user.emailAddress).get();

    if (emailQuery.docs.isEmpty) {
      await users.doc(result.user?.uid).set({
        'userName': user.userName,
        'emailAddress': user.emailAddress,
        'password': _passwordService.encryptPassword(user.password ?? ''),
        'profilePhotoUrl': user.profilePhotoUrl,
        'id': result.user!.uid,
      });
    }
  }

  Future<void> updateUser(String userId, User user) async {
    _fireStoreProvider.update(path: userId, model: user);
  }

  Future<bool> checkUserInfo(String userName) async {
    final userNameQuery =
        await users.where('userName', isEqualTo: userName).get();
    if (userNameQuery.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
