import '../core/init/locale_keys.g.dart';
import 'custom_elevated_button.dart';
import 'custom_elevated_button_with_icon.dart';
import 'custom_text_field.dart';
import 'padding_items.dart';
import 'title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    const String _signIn = 'Sign in';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            TitleWidget(title: LocaleKeys.signIn_registerTitle.tr()),
            CustomTextField(labelText: LocaleKeys.signIn_userName.tr(), inputType: TextInputType.text),
            CustomTextField(labelText: LocaleKeys.base_email.tr(), inputType: TextInputType.emailAddress),
            CustomTextField(
              labelText: LocaleKeys.base_password.tr(),
              inputType: TextInputType.text,
            ),
            CustomElevatedButton(
                buttonText: LocaleKeys.signIn_signUp.tr(), buttonColor: Colors.amber, textColor: Colors.black),
            CustomElevatedButton(
                buttonText: LocaleKeys.signIn_alreadyHaveAccount.tr(),
                buttonColor: Colors.transparent,
                textColor: Colors.white),
            CustomElevatedButtonWithIcon(
                buttonText: LocaleKeys.base_googleLogin.tr(args: [_signIn]), buttonIcon: Icons.g_mobiledata_outlined),
            CustomElevatedButtonWithIcon(
                buttonText: LocaleKeys.base_appleLogin.tr(args: [_signIn]), buttonIcon: Icons.apple_outlined),
            CustomElevatedButtonWithIcon(
                buttonText: LocaleKeys.base_facebookLogin.tr(args: [_signIn]), buttonIcon: Icons.facebook_outlined)
          ],
        ),
      ),
    );
  }
}
