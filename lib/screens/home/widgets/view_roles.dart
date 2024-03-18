import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

// Widgets
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';
import 'package:flutter_cms_business_manager/services/models/role.dart';

// Provider
import 'package:flutter_cms_business_manager/services/providers/cms_provider.dart';
import 'package:provider/provider.dart';

class ViewRoles extends StatelessWidget {
  const ViewRoles({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Role>>(
      future: Provider.of<CMSProvider>(context, listen: false).getRoles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(
                        initialIndex: 0,
                        key: ValueKey("MainScreen"),
                      ),
                    ),
                  );
                },
              ),
              title: const Text(
                'View Roles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.primaryColor,
              titleTextStyle: const TextStyle(
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.error != null) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(
                        initialIndex: 0,
                        key: ValueKey("MainScreen"),
                      ),
                    ),
                  );
                },
              ),
              title: const Text(
                'View Roles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.primaryColor,
              titleTextStyle: const TextStyle(
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
            body: const Center(
              child: Text(
                'An error occurred while fetching roles',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(
                        initialIndex: 0,
                        key: ValueKey("MainScreen"),
                      ),
                    ),
                  );
                },
              ),
              title: const Text(
                'View Roles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.primaryColor,
              titleTextStyle: const TextStyle(
                color: AppColors.black,
                fontSize: 20,
              ),
            ),
            body: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].jobTitle),
                  subtitle: Text(
                      'Salary: ${snapshot.data?[index].salary}\nDepartment: ${snapshot.data?[index].department}'),
                );
              },
            ),
          );
        }
      },
    );
  }
}
