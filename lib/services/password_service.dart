import 'dart:convert';

import 'package:crypto/crypto.dart';

class PasswordService {
  PasswordService._init();
  static final PasswordService _instance = PasswordService._init();
  static PasswordService get instance => _instance;

  String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  bool verifyPassword(String enteredPassword, String encryptedPassword) {
    final enteredEncryptedPassword = encryptPassword(enteredPassword);
    return enteredEncryptedPassword == encryptedPassword;
  }
}
