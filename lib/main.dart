import 'package:ask2movie/core/device/constants.dart';
import 'package:ask2movie/initialize/application_start.dart';
import 'package:ask2movie/screens/wrapper_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  await ApplicationStart.init();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(
    EasyLocalization(
      supportedLocales: [Locales.en.locale],
      path: Locales.path,
      fallbackLocale: Locales.en.locale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const WrapperView(),
    );
  }
}
