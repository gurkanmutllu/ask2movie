import 'package:ask2movie/customs/text_fields/custom_text_field.dart';
import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/screens/mixins/settings_view_mixin.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:ask2movie/services/user_service.dart';
import 'package:ask2movie/utility/mixins/navigation_wrapper_mixin.dart';
import 'package:flutter/material.dart';

class CustomUpdateTextButton extends StatelessWidget
    with SettingsViewMixinStateless, NavigationWrapperMixinStateless {
  CustomUpdateTextButton({
    required this.title,
    required this.textFieldLabel,
    required this.inputType,
    required this.user,
    required this.value,
    super.key,
    required this.text,
  });

  final String title;
  final String textFieldLabel;
  final TextInputType inputType;
  final TextEditingController _controller = TextEditingController();
  final User user;
  final String value;
  final String text;
  final _userService = UserService.instance;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: SizedBox(
            height: 300,
            child: Center(
              child: Column(
                children: [
                  Text(text),
                  CustomTextFormField(
                    labelText: textFieldLabel,
                    inputType: inputType,
                    controller: _controller,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                late User updatedUser;
                switch (value) {
                  case 'userName':
                    updatedUser = user.copyWith(
                      userName: _controller.text,
                    );
                  case 'emailAddress':
                    updatedUser = user.copyWith(
                      emailAddress: _controller.text,
                    );
                  case 'password':
                    updatedUser = user.copyWith(
                      password: _controller.text,
                    );
                  default:
                    updatedUser = user;
                }
                final currentUid = await AuthService.instance.getCurrentUid();

                await _userService.updateUser(currentUid, updatedUser);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) {
                    Navigator.pop(context, 'OK');
                  }
                });
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Icon(
            Icons.chevron_right_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
