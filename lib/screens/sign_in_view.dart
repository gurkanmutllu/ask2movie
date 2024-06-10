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

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView>
    with NavigationWrapperMixin, SignInViewMixin {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _userNameController;
  late final GlobalKey<FormState> _key;
  late File? _selectedImage;
  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    _selectedImage = null;
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
            key: _key,
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
                  controller: _userNameController,
                  labelText: LocaleKeys.base_userName.tr(),
                  inputType: TextInputType.text,
                ),
                CustomTextFormField(
                  validator: (value) => value!.isEmpty
                      ? LocaleKeys.base_couldNotEmpty.tr()
                      : null,
                  controller: _emailController,
                  labelText: LocaleKeys.base_email.tr(),
                  inputType: TextInputType.emailAddress,
                ),
                CustomTextFormField(
                  validator: (value) => value!.isEmpty
                      ? LocaleKeys.base_couldNotEmpty.tr()
                      : null,
                  controller: _passwordController,
                  labelText: LocaleKeys.base_password.tr(),
                  inputType: TextInputType.text,
                  isObscure: true,
                ),
                CustomElevatedButton(
                  buttonText: 'Select an image',
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  onPressed: _pickImageFromGallery,
                ),
                // SizedBox(
                //   height: 50,
                //   child: Image.file(_selectedImage!),
                // ),
                CustomElevatedButton(
                  buttonText: LocaleKeys.signIn_signUp.tr(),
                  buttonColor: Colors.amber,
                  textColor: Colors.black,
                  onPressed: () async {
                    final isSuccess = await addUser(
                      userName: _userNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      profilePhoto: _selectedImage,
                      key: _key,
                      dialogMessage: 'email or username already in use',
                      snackbarMessage: 'email address is not valid',
                    );
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
                      log('object');
                      setState(() {});
                    });
                  },
                  buttonText: LocaleKeys.signIn_alreadyHaveAccount.tr(),
                  buttonColor: Colors.transparent,
                  textColor: Colors.white,
                ),
                CustomElevatedButton.icon(
                  onPressed: () {},
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

  Future<void> _pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

      setState(() {
        _selectedImage = File(pickedImage.path);
      });

      if (_selectedImage != null) {
        log('Image selected: ${_selectedImage!.path}');
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }
}
