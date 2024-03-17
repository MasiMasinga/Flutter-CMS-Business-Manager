import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';
import 'package:flutter_cms_business_manager/common/widgets/snack_bar.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/settings/update_email.dart';
import 'package:flutter_cms_business_manager/screens/settings/update_name.dart';
import 'package:flutter_cms_business_manager/screens/settings/update_password.dart';
import 'package:flutter_cms_business_manager/screens/auth/login.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:flutter_cms_business_manager/services/providers/auth_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Update Name'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UpdateName()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Update Email'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateEmail(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Update Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UpdatePassword()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                authProvider.logout();
                CustomSnackBar.show(context, 'Logged out successfully',
                    backgroundColor: AppColors.lightGreen,
                    textColor: AppColors.white);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
