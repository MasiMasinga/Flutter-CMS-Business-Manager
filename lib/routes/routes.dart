import 'package:flutter/material.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/auth/forgot_password.dart';
import 'package:flutter_cms_business_manager/screens/auth/login.dart';
import 'package:flutter_cms_business_manager/screens/auth/register.dart';
import 'package:flutter_cms_business_manager/screens/auth/reset_password.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/create_department.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/create_employee.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/create_role.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/view_departments.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/view_employees.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/view_roles.dart';
import 'package:flutter_cms_business_manager/screens/settings/settings.dart';
import 'package:flutter_cms_business_manager/screens/settings/update_email.dart';
import 'package:flutter_cms_business_manager/screens/settings/update_name.dart';
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
        return MaterialPageRoute(builder: (_) => const Register());
      case '/reset-password':
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const MainScreen(
            initialIndex: 0,
            key: ValueKey("MainScreen"),
          ),
        );
      case '/settings':
        return MaterialPageRoute(builder: (_) => const Settings());
      case '/update-name':
        return MaterialPageRoute(builder: (_) => const UpdateName());
      case '/update-email':
        return MaterialPageRoute(builder: (_) => const UpdateEmail());
      case '/update-password':
        return MaterialPageRoute(builder: (_) => const UpdatePassword());
      case '/create-department':
        return MaterialPageRoute(builder: (_) => const CreateDepartment());
      case '/view-department':
        return MaterialPageRoute(builder: (_) => const ViewDepartments());
      case '/create-role':
        return MaterialPageRoute(builder: (_) => const CreateRole());
      case '/view-roles':
        return MaterialPageRoute(builder: (_) => const ViewRoles());
      case '/create-employee':
        return MaterialPageRoute(builder: (_) => const CreateEmployee());
      case '/view-employee':
        return MaterialPageRoute(builder: (_) => const ViewEmployees());
      default:
        throw ('This route name does not exit');
    }
  }
}
