import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Map<String, dynamic>>> readJsonFile(String path) async {
  final contents = await rootBundle.loadString(path);
  final jsonData = jsonDecode(contents) as List<dynamic>;
  return jsonData.map((e) => e as Map<String, dynamic>).toList();
}

class MovieJsonToFirebase extends StatelessWidget {
  const MovieJsonToFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: UploadJsonToFirestoreButton(),
      ),
    );
  }
}

class UploadJsonToFirestoreButton extends StatelessWidget {
  const UploadJsonToFirestoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await uploadJsonToFirestore();
      },
      child: const Text('Upload JSON to Firestore'),
    );
  }
}

Future<void> uploadJsonToFirestore() async {
  try {
    const jsonFilePath = 'assets/jsons/movies.json';

    final movies = await readJsonFile(jsonFilePath);

    final collectionRef = FirebaseFirestore.instance.collection('movies');

    for (final movie in movies) {
      await collectionRef.add(movie);
    }

    log('Data uploaded successfully');
  } catch (e) {
    log('Error uploading data: $e');
  }
}


// rules_version = '2';

// service cloud.firestore {
//   match /databases/{database}/documents {
    
//     match /{document=**} {
//       allow read: if true;
//     }

    
//     match /users/{userId} {
//       allow read: if request.auth != null;
//       allow write: if request.auth != null;
//     }
//   }
// }
