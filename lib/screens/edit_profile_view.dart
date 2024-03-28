import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_elevated_button.dart';
import 'package:ask2movie/customs/text_fields/custom_text_field.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            TitleWidget(title: LocaleKeys.editProfile_editProfileTitle.tr()),
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
            // Edit profile photo
            Padding(
              padding: PaddingItems.topPadding,
              child: CustomElevatedButton(
                buttonText: LocaleKeys.editProfile_saveChanges.tr(),
                buttonColor: Colors.amber,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
