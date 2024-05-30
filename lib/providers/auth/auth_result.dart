class AuthResult<UserCredential, FirebaseAuthException> {
  AuthResult({this.data, this.exception});
  final UserCredential? data;
  final FirebaseAuthException? exception;
}
