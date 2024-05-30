import 'package:ask2movie/utility/base/base_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProvider {
  FireStoreProvider._init();
  static final FireStoreProvider _instancee = FireStoreProvider._init();
  static FireStoreProvider get instance => _instancee;
  final _instance = FirebaseFirestore.instance;

  void update<T extends IdModel>({
    required String path,
    required BaseFirebaseModel<T> model,
  }) {
    _instance.doc(path).update(model.toJson());
  }
}
