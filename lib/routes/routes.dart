import 'package:flutter/material.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/auth/forgot_password.dart';
import 'package:flutter_cms_business_manager/screens/auth/login.dart';
import 'package:flutter_cms_business_manager/screens/auth/register.dart';
import 'package:flutter_cms_business_manager/screens/auth/reset_password.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';
import 'package:flutter_cms_business_manager/screens/settings/settings.dart';
import 'package:flutter_cms_business_manager/screens/settings/update_email.dart';
import 'package:flutter_cms_business_manager/screens/settings/update_password.dart';
import 'package:flutter_cms_business_manager/screens/splash/splash.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/reset-password':
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const Settings());
      case '/update-email':
        return MaterialPageRoute(builder: (_) => UpdateEmail());
      case '/update-password':
        return MaterialPageRoute(builder: (_) => UpdatePassword());
      default:
        throw ('This route name does not exit');
    }
  }
}
