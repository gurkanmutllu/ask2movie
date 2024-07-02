import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_text_button.dart';
import 'package:ask2movie/customs/text_fields/custom_text_field.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/screens/mixins/reset_password_mixin.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget with ResetPasswordMixin {
  ResetPasswordView({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: TitleWidget(title: 'Reset password')),
      ),
      body: Center(
        child: Padding(
          padding: PaddingItems.horizontalPadding2x,
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              CustomTextFormField(
                labelText: 'Reset password',
                inputType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              CustomTextButton.m1(
                onPressed: () async {
                  await resetPassword(
                    email: _emailController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Email sent to ${_emailController.text}'),
                    ),
                  );
                },
                title: 'Send link',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
