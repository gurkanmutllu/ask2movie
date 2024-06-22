import 'package:ask2movie/models/dialogue_model.dart';
import 'package:ask2movie/providers/fire_store_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DialogueService {
  DialogueService._init();
  static final DialogueService _instance = DialogueService._init();
  static DialogueService get instance => _instance;

  final _fireStoreProvider = FireStoreProvider.instance;

  Future<List<Dialogue>> getDialogues() async {
    try {
      final result = await _fireStoreProvider.get(
        path: 'dialogues',
        model: Dialogue(),
      );
      return result;
    } catch (e) {
      Exception(e);
      return List.empty();
    }
  }

  Future<List<Dialogue>> fetchDialogues() async {
    final dialoguesList = <Dialogue>[];
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('dialogues')
        .limit(10)
        .get();

    for (final doc in snapshot.docs) {
      final data = doc.data()! as Map<String, dynamic>;
      final dialogue = Dialogue().fromJson(data);
      dialoguesList.add(dialogue);
    }

    return dialoguesList;
  }
}
