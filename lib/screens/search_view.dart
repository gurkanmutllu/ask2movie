import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellowAccent,
        child: const Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
