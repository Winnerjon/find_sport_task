import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void logOut() {
    // DbService().clearLocalData().then((value) {
    //   navigatorKey.currentContext!.go(SignInScreen.routeName);
    // });
  }

  static BuildContext? get context => navigatorKey.currentContext;
}
