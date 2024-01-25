import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static var path = 'assets/lang';
  static const startLocale = Locale('uz');
  static var locales = [
    const Locale('ru'),
    const Locale('uz', 'UZ'),
    const Locale('uz'),
  ];

  static String tr(String key) {
    return key.tr();
  }

  static Future<void> change(BuildContext context, String languageCode, String? countryCode) async {
    context.setLocale(Locale(languageCode, countryCode));
  }
}