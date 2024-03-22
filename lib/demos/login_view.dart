import '../core/init/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'custom_elevated_button.dart';
import 'custom_elevated_button_with_icon.dart';
import 'custom_text_field.dart';
import 'title_widget.dart';
import 'package:flutter/material.dart';

import 'padding_items.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final String _login = 'Log in';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            TitleWidget(title: LocaleKeys.login_loginTitle.tr()),
            CustomTextField(
              labelText: LocaleKeys.base_email.tr(),
              inputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: LocaleKeys.base_password.tr(),
              inputType: TextInputType.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    LocaleKeys.login_forgotPassword.tr(),
                    style: const TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            CustomElevatedButton(
              buttonText: LocaleKeys.login_login.tr(),
              buttonColor: Colors.amber,
              textColor: Colors.black,
            ),
            CustomElevatedButton(
                buttonText: LocaleKeys.login_doHaveAccount.tr(),
                buttonColor: Colors.transparent,
                textColor: Colors.white),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: Text(LocaleKeys.login_or.tr()),
            ),
            CustomElevatedButtonWithIcon(
              buttonText: LocaleKeys.base_googleLogin.tr(args: [_login]),
              buttonIcon: Icons.g_mobiledata_outlined,
            ),
            CustomElevatedButtonWithIcon(
              buttonText: LocaleKeys.base_appleLogin.tr(args: [_login]),
              buttonIcon: Icons.apple_outlined,
            ),
            CustomElevatedButtonWithIcon(
              buttonText: LocaleKeys.base_facebookLogin.tr(args: [_login]),
              buttonIcon: Icons.facebook_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
