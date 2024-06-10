import 'package:ask2movie/utility/base/base_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProvider {
  FireStoreProvider._init();
  static final FireStoreProvider _instancee = FireStoreProvider._init();
  static FireStoreProvider get instance => _instancee;
  final _instance = FirebaseFirestore.instance;

  void add<T extends IdModel>({
    required String path,
    required BaseFirebaseModel<T> model,
  }) {
    _instance.doc(path).set(model.toJson());
  }

  void update<T extends IdModel>({
    required String path,
    required BaseFirebaseModel<T> model,
  }) {
    _instance.doc(path).update(model.toJson());
  }

  Future<List<T>> get<T extends IdModel>({
    required String path,
    required BaseFirebaseModel<T> model,
  }) async {
    final collection = await _instance.collection(path).get();

    final items = <T>[];

    for (final doc in collection.docs) {
      final data = doc.data();
      final item = model.fromJson(data);
      items.add(item);
    }
    return items;
  }

  Future<T> getById<T extends IdModel>({
    required String path,
    required String id,
    required BaseFirebaseModel<T> model,
  }) async {
    final doc = await _instance.collection(path).doc(id).get();
    final idModel = model.fromJson(doc.data()!);
    return idModel;
  }
}
