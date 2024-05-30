import 'package:ask2movie/core/project_items/image_items.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_update_text_button.dart';
import 'package:ask2movie/customs/images/custom_png_image.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/screens/mixins/settings_view_mixin.dart';
import 'package:flutter/material.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView>
    with SettingsViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: PaddingItems.topPadding2x,
          child: TitleWidget(title: 'Ask2Movie'),
        ),
        actions: const [
          Padding(
            padding: PaddingItems.horizontalPadding,
            child: PngImage(name: ImageItems.ask2movieIcon),
          ),
        ],
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            FutureBuilder(
              future: getCurrentUser(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Placeholder();
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return const LinearProgressIndicator();
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      final user = snapshot.data;
                      return _UserInfoColumn(
                        user: user!,
                      );
                    } else {
                      return const SizedBox(
                        child: Center(
                          child: Text('no user logged in.'),
                        ),
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfoColumn extends StatelessWidget {
  const _UserInfoColumn({
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.horizontalPadding,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.amber),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  user.profilePhotoUrl ?? '',
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
            width: 150,
          ),
          const Padding(
            padding: PaddingItems.topPadding2x,
          ),
          SubTitleWidget.m2(
            title: user.userName ?? '',
            textColor: Colors.amber,
          ),
          CustomUpdateTextButton(
            title: 'Update username',
            buttonTitle: 'Update username',
            textFieldLabel: 'username',
            inputType: TextInputType.name,
            user: user,
            value: 'userName',
          ),
          CustomUpdateTextButton(
            title: 'Update email address',
            buttonTitle: 'Update email address',
            textFieldLabel: 'email address',
            inputType: TextInputType.name,
            user: user,
            value: 'emailAddress',
          ),
          CustomUpdateTextButton(
            title: 'Update password',
            buttonTitle: 'Update password',
            textFieldLabel: 'password',
            inputType: TextInputType.name,
            user: user,
            value: 'password',
          ),
        ],
      ),
    );
  }
}
