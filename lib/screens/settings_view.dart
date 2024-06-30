import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/buttons/custom_text_button.dart';
import 'package:ask2movie/customs/buttons/custom_text_button_with_bottomsheet.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/models/user_model.dart';
import 'package:ask2movie/product/constants/string_constants.dart';
import 'package:ask2movie/screens/login_view.dart';
import 'package:ask2movie/screens/mixins/settings_view_mixin.dart';
import 'package:ask2movie/screens/update_profile_view.dart';
import 'package:ask2movie/services/auth_service.dart';
import 'package:ask2movie/utility/mixins/navigation_wrapper_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with NavigationWrapperMixin, SettingsViewMixin {
  late final AuthService _authService;
  @override
  void initState() {
    super.initState();
    _authService = AuthService.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: PaddingItems.topPadding,
          child: TitleWidget(title: LocaleKeys.settings_settingsTitle.tr()),
        ),
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding2x,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                          return _UserInfoRow(
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
                SubTitleWidget.m2(
                  title: LocaleKeys.settings_accountSettings.tr(),
                  textColor: Colors.grey,
                ),
                CustomTextButton.m1(
                  title: LocaleKeys.settings_editProfile.tr(),
                  onPressed: () {
                    pushTo(const UpdateProfileView());
                  },
                ),
                CustomTextButton.m1(
                  title: LocaleKeys.settings_logOut.tr(),
                  onPressed: () {
                    _authService.signOut();
                    pushReplaceAll(const LoginView());
                  },
                ),
              ],
            ),
            Padding(
              padding: PaddingItems.bottomPadding,
              child: Column(
                children: [
                  Text(
                    LocaleKeys.base_more.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  CustomTextButtonBottomsheet.m1(
                    bottomsheetText: StringConstants.aboutUs,
                    title: LocaleKeys.settings_aboutUs.tr(),
                  ),
                  CustomTextButtonBottomsheet.m1(
                    bottomsheetText: StringConstants.privacyPolicy,
                    title: LocaleKeys.settings_privacyPolicy.tr(),
                  ),
                  CustomTextButtonBottomsheet.m1(
                    bottomsheetText: StringConstants.termsAndConditions,
                    title: LocaleKeys.settings_terms.tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfoRow extends StatelessWidget {
  const _UserInfoRow({
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                user.profilePhotoUrl ?? '',
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 50,
          width: 50,
        ),
        Padding(
          padding: PaddingItems.horizontalPadding,
          child: Text(user.userName ?? ''),
        ),
      ],
    );
  }
}
