import 'package:flutter/material.dart';

// Provider
import 'package:provider/provider.dart';
import 'package:flutter_cms_business_manager/services/providers/auth_provider.dart';
import 'package:flutter_cms_business_manager/services/providers/cms_provider.dart';
import 'package:flutter_cms_business_manager/services/providers/user_provider.dart';

// Routes
import 'package:flutter_cms_business_manager/routes/routes.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/splash/splash.dart';

// Dotenv
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => CMSProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter CMS Business Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes.generateRoute,
        home: const Splash(),
      ),
    );
  }
}
