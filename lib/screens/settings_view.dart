import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left_outlined),
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
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://ps.w.org/simple-user-avatar/assets/icon-256x256.png?rev=2413146',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 50,
                      width: 50,
                    ),
                    const Padding(
                      padding: PaddingItems.horizontalPadding,
                      child: Text('User Name'),
                    ),
                  ],
                ),
                SubTitleWidget.m2(
                  title: LocaleKeys.settings_accountSettings.tr(),
                  textColor: Colors.grey,
                ),
                _CustomSettingsTextButton(
                  title: LocaleKeys.settings_editProfile.tr(),
                ),
                _CustomSettingsTextButton(
                  title: LocaleKeys.settings_changeLanguage.tr(),
                ),
                _CustomSettingsTextButton(
                  title: LocaleKeys.settings_logOut.tr(),
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
                  _CustomSettingsTextButton(
                    title: LocaleKeys.settings_aboutUs.tr(),
                  ),
                  _CustomSettingsTextButton(
                    title: LocaleKeys.settings_privacyPolicy.tr(),
                  ),
                  _CustomSettingsTextButton(
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

class _CustomSettingsTextButton extends StatelessWidget {
  const _CustomSettingsTextButton({
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.halfTopPadding,
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            const Icon(
              Icons.chevron_right_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
