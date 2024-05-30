import 'package:flutter/material.dart';

class PngImage extends StatelessWidget {
  const PngImage({required this.name, super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.fill,
    );
  }

  String get _nameWithPath => 'assets/icons/$name.png';
}
