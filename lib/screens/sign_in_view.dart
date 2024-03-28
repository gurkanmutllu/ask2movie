import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_elevated_button.dart';
import 'package:ask2movie/customs/text_fields/custom_text_field.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    const signIn = 'Sign in';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            TitleWidget(title: LocaleKeys.signIn_registerTitle.tr()),
            CustomTextField(
              labelText: LocaleKeys.base_userName.tr(),
              inputType: TextInputType.text,
            ),
            CustomTextField(
              labelText: LocaleKeys.base_email.tr(),
              inputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: LocaleKeys.base_password.tr(),
              inputType: TextInputType.text,
            ),
            CustomElevatedButton(
              buttonText: LocaleKeys.signIn_signUp.tr(),
              buttonColor: Colors.amber,
              textColor: Colors.black,
            ),
            CustomElevatedButton(
              buttonText: LocaleKeys.signIn_alreadyHaveAccount.tr(),
              buttonColor: Colors.transparent,
              textColor: Colors.white,
            ),
            CustomElevatedButton.icon(
              buttonText: LocaleKeys.base_googleLogin.tr(args: [signIn]),
              buttonIcon: Icons.g_mobiledata_outlined,
            ),
            CustomElevatedButton.icon(
              buttonText: LocaleKeys.base_appleLogin.tr(args: [signIn]),
              buttonIcon: Icons.apple_outlined,
            ),
            CustomElevatedButton.icon(
              buttonText: LocaleKeys.base_facebookLogin.tr(args: [signIn]),
              buttonIcon: Icons.facebook_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
