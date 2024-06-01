import 'dart:developer';

import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/providers/fire_store_provider.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  UserService._init();
  static final UserService _instance = UserService._init();
  static UserService get instance => _instance;

  final _fireStoreProvider = FireStoreProvider.instance;
  final _authService = AuthService.instance;

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

  Future<void> addUser(String userId, User user) async {
    final path = 'users/$userId';
    final emailQuery =
        await users.where('emailAddress', isEqualTo: user.emailAddress).get();
    if (emailQuery.docs.isEmpty) {
      _fireStoreProvider.add(path: path, model: user);
    }
  }

  Future<void> updateUser(String userId, User user) async {
    final path = 'users/$userId';
    _fireStoreProvider.update(path: path, model: user);
    await _authService.updateUser(userId: userId, user: user);
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
