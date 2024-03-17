import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

// Widgets
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';
import 'package:flutter_cms_business_manager/services/models/role.dart';

class ViewRoles extends StatelessWidget {
  const ViewRoles({super.key});

  @override
  Widget build(BuildContext context) {
    List<Role> roles = getRoles();

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
        itemCount: roles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(roles[index].jobTitle),
            subtitle: Text(
                'Salary: ${roles[index].salary}\nDepartment: ${roles[index].department}'),
          );
        },
      ),
    );
  }
}

List<Role> getRoles() {
  // This is just a placeholder. Replace this with your actual code for fetching the roles.
  return [
    Role(jobTitle: 'Developer', salary: '80000', department: 'IT'),
    Role(jobTitle: 'Designer', salary: '70000', department: 'Marketing'),
  ];
}
