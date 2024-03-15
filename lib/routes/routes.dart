import 'package:flutter/material.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/auth/forgot_password.dart';
import 'package:flutter_cms_business_manager/screens/auth/login.dart';
import 'package:flutter_cms_business_manager/screens/auth/register.dart';
import 'package:flutter_cms_business_manager/screens/auth/reset_password.dart';
import 'package:flutter_cms_business_manager/screens/home/home.dart';
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
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/reset-password':
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const Settings());
      case '/update-email':
        return MaterialPageRoute(builder: (_) => const UpdateEmail());
      case '/update-password':
        return MaterialPageRoute(builder: (_) => const UpdatePassword());
      default:
        throw ('This route name does not exit');
    }
  }
}
