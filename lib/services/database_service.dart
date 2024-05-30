import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService({required this.uid});

  final String uid;
  final CollectionReference ask2movieCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(
    String userName,
    String emailAddress,
    String password,
  ) async {
    return ask2movieCollection.doc(uid).set({
      'userName': userName,
      'emailAddress': emailAddress,
      'password': password,
    });
  }
}
