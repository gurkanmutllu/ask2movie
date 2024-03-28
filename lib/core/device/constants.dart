import 'package:flutter/rendering.dart';

enum Locales {
  tr(locale: Locale('tr', 'TR')),
  en(locale: Locale('en', 'US')),
  ;

  const Locales({required this.locale});
  final Locale locale;

  static const path = 'assets/lang';
}
