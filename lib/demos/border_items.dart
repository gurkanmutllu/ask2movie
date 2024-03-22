import 'package:flutter/material.dart';

class BorderItems {
  static const RoundedRectangleBorder roundedRectangleBorderSide = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Colors.amber));

  static const RoundedRectangleBorder roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)));
}
