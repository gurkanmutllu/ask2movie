import 'package:ask2movie/services/auth_service.dart';

mixin ResetPasswordMixin {
  final AuthService _authService = AuthService.instance;

  Future<bool> resetPassword({
    required String email,
  }) async {
    await _authService.resetPassword(email: email);
    return true;
  }
}
