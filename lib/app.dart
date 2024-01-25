import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport_task/src/common/style/themes.dart';
import 'package:find_sport_task/src/services/navigation/go_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FindSport',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: AppGoRouter.router,
    );
  }
}