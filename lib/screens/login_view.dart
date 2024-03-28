import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_elevated_button.dart';
import 'package:ask2movie/customs/text_fields/custom_text_field.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    const login = 'Log in';
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
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
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
              textColor: Colors.white,
            ),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: Text(LocaleKeys.login_or.tr()),
            ),
            CustomElevatedButton.icon(
              buttonText: LocaleKeys.base_googleLogin.tr(args: [login]),
              buttonIcon: Icons.g_mobiledata_outlined,
            ),
            CustomElevatedButton.icon(
              buttonText: LocaleKeys.base_appleLogin.tr(args: [login]),
              buttonIcon: Icons.apple_outlined,
            ),
            CustomElevatedButton.icon(
              buttonText: LocaleKeys.base_facebookLogin.tr(args: [login]),
              buttonIcon: Icons.facebook_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
