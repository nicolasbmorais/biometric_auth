import 'package:biometric_auth/src/view/auth_check.dart';
import 'package:biometric_auth/src/view/welcome_page.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    '/auth_check': (_) => const AuthCheckPage(),
    '/welcome_page': (_) => const WelcomePage(),
  };

  static const String authCheck = '/auth_check';
  static const String welcomePage = '/welcome_page';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
