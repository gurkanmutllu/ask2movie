import 'package:flutter/material.dart';

mixin NavigationWrapperMixin<T extends StatefulWidget> on State<T> {
  Future<void> pushTo(Widget page) async {
    await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (context) => page,
      ),
    );
  }

  void pushReplaceAll(Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<dynamic>(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop(context);
  }
}
mixin NavigationWrapperMixinStateless on StatelessWidget {
  void pushTo(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (context) => page,
      ),
    );
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop(context);
  }
}
