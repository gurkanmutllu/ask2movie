import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/image_items.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_elevated_button.dart';
import 'package:ask2movie/customs/images/custom_png_image.dart';
import 'package:ask2movie/customs/text_fields/custom_text_field.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/product/constants/string_constants.dart';
import 'package:ask2movie/screens/bottom_navbar_view.dart';
import 'package:ask2movie/screens/mixins/login_view_mixin.dart';
import 'package:ask2movie/screens/reset_password_view.dart';
import 'package:ask2movie/screens/sign_in_view.dart';
import 'package:ask2movie/utility/mixins/navigation_wrapper_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with NavigationWrapperMixin, LoginViewMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(Icons.login_outlined),
        title: Padding(
          padding: PaddingItems.topPadding,
          child: TitleWidget(title: LocaleKeys.login_loginTitle.tr()),
        ),
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Padding(
          padding: PaddingItems.topPadding2x,
          child: Form(
            key: key,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: PngImage(name: ImageItems.ask2movieIcon),
                ),
                CustomTextFormField(
                  validator: (value) => value!.isEmpty
                      ? LocaleKeys.base_couldNotEmpty.tr()
                      : null,
                  controller: emailController,
                  labelText: LocaleKeys.base_email.tr(),
                  inputType: TextInputType.emailAddress,
                ),
                CustomTextFormField(
                  validator: (value) => value!.isEmpty
                      ? LocaleKeys.base_couldNotEmpty.tr()
                      : null,
                  controller: passwordController,
                  labelText: LocaleKeys.base_password.tr(),
                  inputType: TextInputType.text,
                  isObscure: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        child: Text(
                          LocaleKeys.login_forgotPassword.tr(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {
                          pushTo(ResetPasswordView());
                        }),
                  ],
                ),
                CustomElevatedButton(
                  buttonText: LocaleKeys.login_login.tr(),
                  buttonColor: Colors.amber,
                  textColor: Colors.black,
                  onPressed: () async {
                    final result = await login();
                    if (result == true) {
                      pushReplaceAll(const BottomNavBar());
                    } else {
                      if (!context.mounted) return;
                      await _showEmailInUseDialog(
                        context,
                        StringConstants.wrongEmailOrPassword,
                      );
                    }
                  },
                ),
                CustomElevatedButton(
                  onPressed: () async {
                    await pushTo(const SignInView());
                  },
                  buttonText: LocaleKeys.login_doHaveAccount.tr(),
                  buttonColor: Colors.transparent,
                  textColor: Colors.white,
                ),
                Padding(
                  padding: PaddingItems.verticalPadding,
                  child: Text(LocaleKeys.login_or.tr()),
                ),
                CustomElevatedButton.icon(
                  onPressed: () async {
                    final result = await googleLogin();
                    if (result == true) {
                      pushReplaceAll(const BottomNavBar());
                    } else {
                      if (!context.mounted) return;
                      await _showEmailInUseDialog(
                        context,
                        StringConstants.wrongEmailOrPassword,
                      );
                    }
                  },
                  buttonText: LocaleKeys.base_googleLogin.tr(
                    args: [StringConstants.loginString],
                  ),
                  buttonIcon: Icons.g_mobiledata_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _showEmailInUseDialog(BuildContext context, String message) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
      );
    },
  );
}
