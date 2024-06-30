import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarFun(
  BuildContext context,
  String message,
) {
  final snackBar = SnackBar(
    content: Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    backgroundColor: Colors.amber,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 150,
      left: 10,
      right: 10,
    ),
  );

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
