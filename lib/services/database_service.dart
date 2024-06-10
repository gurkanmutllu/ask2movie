import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseService {
  DatabaseService();

  Future<String> uploadImageToTemp(File imageFile) async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('temp/${basename(imageFile.path)}');
    final uploadTask = ref.putFile(imageFile);

    final snapshot = await uploadTask;
    final url = await snapshot.ref.getDownloadURL();

    return url;
  }

  Future<String> moveImageToUserFolder(
    String tempImageUrl,
    String userId,
  ) async {
    final storage = FirebaseStorage.instance;
    final tempRef = storage.refFromURL(tempImageUrl);
    final userRef =
        storage.ref().child('users/$userId/${basename(tempRef.name)}');

    final data = await tempRef.getData();

    final uploadTask = userRef.putData(data!);
    await uploadTask;

    await tempRef.delete();

    final newUrl = await userRef.getDownloadURL();

    return newUrl;
  }
}
