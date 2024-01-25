import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport_task/app.dart';
import 'package:find_sport_task/src/common/localization/localization.dart';
import 'package:find_sport_task/src/services/local_db/db_service.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AndroidYandexMap.useAndroidViewSurface = false;
  await DbService.initSharedPref();
  runApp(
    EasyLocalization(
      saveLocale: true,
      path: AppLocalization.path,
      supportedLocales: AppLocalization.locales,
      startLocale: AppLocalization.startLocale,
      fallbackLocale: AppLocalization.startLocale,
      child: const MyApp(),
    ),
  );
}