import 'package:ask2movie/core/init/extension/string_extensions.dart';
import 'package:ask2movie/core/init/locale_keys.g.dart';

import 'title_widget.dart';
import 'package:flutter/material.dart';

import 'padding_items.dart';
import 'string_items.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            TitleWidget(title: LocaleKeys.login_loginTitle.locale),
            Text(LocaleKeys.login_hello.locale),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
            ),
            const TextField(),
          ],
        ),
      ),
    );
  }
}

FloatingActionButton buildFloatingActionButton() {
  return FloatingActionButton.extended(
      label: Text(LocaleKeys.login_loginMessage.locale), icon: const Icon(Icons.arrow_forward), onPressed: () {});
}
