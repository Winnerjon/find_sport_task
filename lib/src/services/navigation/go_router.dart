import 'package:find_sport_task/src/features/ads/screen/ads_screen.dart';
import 'package:find_sport_task/src/features/auth/reg/screen/reg_screen.dart';
import 'package:find_sport_task/src/features/on_boarding/language_screen.dart';
import 'package:find_sport_task/src/services/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppGoRouter {
  static final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: LanguageScreen.routeName,
    routes: [
      GoRoute(
        path: LanguageScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(
          child: LanguageScreen(),
        ),
      ),
      GoRoute(
        path: RegScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(
          child: RegScreen(),
        ),
      ),
      GoRoute(
        path: AdsScreen.routeName,
        pageBuilder: (context, state) => const MaterialPage(
          child: AdsScreen(),
        ),
      ),
    ],
  );
}
