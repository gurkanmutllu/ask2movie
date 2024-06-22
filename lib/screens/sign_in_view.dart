import 'dart:developer';
import 'dart:io';

import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/image_items.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_elevated_button.dart';
import 'package:ask2movie/customs/images/custom_png_image.dart';
import 'package:ask2movie/customs/text_fields/custom_text_field.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/screens/bottom_navbar_view.dart';
import 'package:ask2movie/screens/mixins/signin_view_mixin.dart';
import 'package:ask2movie/utility/mixins/navigation_wrapper_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView>
    with NavigationWrapperMixin, SignInViewMixin {
  late bool _isSelected;
  @override
  void initState() {
    super.initState();
    selectedImage = null;
    _isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    const signInString = 'Sign in';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Icon(Icons.app_registration_outlined),
        title: Padding(
          padding: PaddingItems.topPadding,
          child: TitleWidget(title: LocaleKeys.signIn_registerTitle.tr()),
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
                SizedBox(
                  height: 100,
                  width: 100,
                  child: _isSelected
                      ? _selectedImageBox()
                      : const PngImage(name: ImageItems.ask2movieIcon),
                ),
                CustomTextFormField(
                  validator: (value) => value!.isEmpty
                      ? LocaleKeys.base_couldNotEmpty.tr()
                      : null,
                  controller: userNameController,
                  labelText: LocaleKeys.base_userName.tr(),
                  inputType: TextInputType.text,
                ),
                CustomTextFormField(
                  validator: (value) =>
                      value.ext.isValidEmail ? null : 'email is not valid',
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
                CustomElevatedButton(
                  buttonText: 'Select a profile photo',
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  onPressed: _pickImageFromGallery,
                ),
                CustomElevatedButton(
                  buttonText: LocaleKeys.signIn_signUp.tr(),
                  buttonColor: Colors.amber,
                  textColor: Colors.black,
                  onPressed: () async {
                    final isSuccess = await addUser();
                    if (isSuccess) {
                      pushReplaceAll(const BottomNavBar());
                    } else {}
                  },
                ),
                CustomElevatedButton(
                  onPressed: () {
                    // pushTo(const LoginView());
                    pop(context);
                    Future<void>.delayed(const Duration(seconds: 1))
                        .then((value) {
                      setState(() {});
                    });
                  },
                  buttonText: LocaleKeys.signIn_alreadyHaveAccount.tr(),
                  buttonColor: Colors.transparent,
                  textColor: Colors.white,
                ),
                CustomElevatedButton.icon(
                  onPressed: () async {
                    final isSuccess = await addGoogleUser();
                    if (isSuccess) {
                      pushReplaceAll(const BottomNavBar());
                    } else {}
                  },
                  buttonText:
                      LocaleKeys.base_googleLogin.tr(args: [signInString]),
                  buttonIcon: Icons.g_mobiledata_outlined,
                ),
                CustomElevatedButton.icon(
                  onPressed: () {},
                  buttonText:
                      LocaleKeys.base_appleLogin.tr(args: [signInString]),
                  buttonIcon: Icons.apple_outlined,
                ),
                CustomElevatedButton.icon(
                  onPressed: () {},
                  buttonText:
                      LocaleKeys.base_facebookLogin.tr(args: [signInString]),
                  buttonIcon: Icons.facebook_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _selectedImageBox() {
    return SizedBox(
      height: 50,
      child: Image.file(selectedImage!),
    );
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

      setState(() {
        selectedImage = File(pickedImage.path);
        _isSelected = true;
      });

      if (selectedImage != null) {
        log('Image selected: ${selectedImage!.path}');
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }
}
