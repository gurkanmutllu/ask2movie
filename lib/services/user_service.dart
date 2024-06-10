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
      final result = await _fireStoreProvider.getById(
        path: 'users',
        id: userId,
        model: const User(),
      );
      return result;
    } catch (e) {
      log('error getting user');
    }
    return null;
  }

  Future<void> addUser(String userId, User user) async {
    final path = 'users/$userId';

    _fireStoreProvider.add(path: path, model: user);
  }

  Future<void> updateUser(String userId, User user) async {
    final path = 'users/$userId';
    _fireStoreProvider.update(path: path, model: user);
    await _authService.updateUser(userId: userId, user: user);
  }

  Future<bool> checkUserInfo(String userName, String emailAddress) async {
    final userNameQuery =
        await users.where('userName', isEqualTo: userName).get();
    final emailQuery =
        await users.where('emailAddress', isEqualTo: emailAddress).get();

    if (userNameQuery.docs.isEmpty && emailQuery.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
