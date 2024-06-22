import 'package:ask2movie/models/search_dialogue_model.dart';
import 'package:ask2movie/services/dialogue_service.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';

class SearchService {
  SearchService._init();
  static final SearchService _instance = SearchService._init();
  static SearchService get instance => _instance;

  final _dialogueService = DialogueService.instance;

  Future<List<SearchDialogue?>> search(String query) async {
    final dialogueModel = await _dialogueService.fetchDialogues();
    final choices = <String>[];

    for (final model in dialogueModel) {
      if (model.dialogues != null) {
        choices.addAll(model.dialogues!);
      }
    }

    final subDialog = dialogueModel.expand(
      (movie) {
        if (movie.dialogues == null) return <SearchDialogue>[];
        return movie.dialogues!
            .map(
              (text) => SearchDialogue(id: movie.id ?? '', dialogueText: text),
            )
            .toList();
      },
    ).toList();

    final results = extractTop<SearchDialogue?>(
      query: query,
      choices: subDialog,
      limit: 5,
      getter: (obj) => obj?.dialogueText ?? '',
    );

    final list = results.map((result) => result.choice).toList();
    return list;
  }
}

// class FuzzyExample extends StatelessWidget {
//   const FuzzyExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final results = extractTop(
//       query: 'goolge',
//       choices: [
//         'google',
//         'bing',
//         'facebook',
//         'linkedin',
//         'twitter',
//         'googleplus',
//         'bingnews',
//         'plexoogl',
//         'goo',
//       ],
//       limit: 3,
//       cutoff: 10,
//     );

//     final list = <String>[];

//     for (final result in results) {
//       list.add(result.toString());
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const TitleWidget(title: 'title'),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverList.builder(
//             itemCount: list.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Text(list.elementAt(index));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
