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
    required this.buttonTitle,
    required this.textFieldLabel,
    required this.inputType,
    required this.user,
    required this.value,
    super.key,
  });

  final String buttonTitle;
  final String title;
  final String textFieldLabel;
  final TextInputType inputType;
  final TextEditingController _controller = TextEditingController();
  final User user;
  final String value;
  final _userService = UserService.instance;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(buttonTitle),
          content: SizedBox(
            height: 300,
            child: Center(
              child: Column(
                children: [
                  Text(user.userName ?? ''),
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
                final currentUid = await AuthService.instance.getCurrentUid();
                final updatedUser = user.copyWith(userName: _controller.text);
                await _userService.updateUser(currentUid, updatedUser);
                if (!context.mounted) return;

                pop(context);

                // switch (_controller.text) {
                //   case 'userName':
                //     user.userName = _controller.text;
                //     updateUser(user);

                //   case 'emailAddress':
                //     user.emailAddress = _controller.text;
                //     updateUser(user);

                //   case 'password':
                //     user.password = _controller.text;
                //     updateUser(user);
                // }
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
            buttonTitle,
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
