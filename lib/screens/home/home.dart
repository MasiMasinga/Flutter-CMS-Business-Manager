import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/home/widgets/create_department.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/create_employee.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/create_role.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/view_departments.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/view_employees.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/view_roles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            tilePadding: const EdgeInsets.all(15),
            title: const Text(
              'Department',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Create New Department',
                  style: TextStyle(color: AppColors.lightBlue),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateDepartment(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'View Departments',
                  style: TextStyle(
                    color: AppColors.lightBlue,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewDepartments(),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Role',
              style: TextStyle(
                color: AppColors.darkOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Create Role',
                  style: TextStyle(
                    color: AppColors.lightOrange,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateRole(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'View Roles',
                  style: TextStyle(
                    color: AppColors.lightOrange,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewRoles(),
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text(
              'Employee',
              style: TextStyle(
                color: AppColors.darkPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Create Employee',
                  style: TextStyle(
                    color: AppColors.lightPurple,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateEmployee(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'View Employees',
                  style: TextStyle(
                    color: AppColors.lightPurple,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewEmployees(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
