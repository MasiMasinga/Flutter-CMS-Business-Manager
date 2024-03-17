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
            title: const Text('Department'),
            children: <Widget>[
              ListTile(
                title: const Text('Create New Department'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateDepartment()),
                  );
                },
              ),
              ListTile(
                title: const Text('View Departments'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewDepartments()),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Role'),
            children: <Widget>[
              ListTile(
                title: const Text('Create Role'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateRole()),
                  );
                },
              ),
              ListTile(
                title: const Text('View Roles'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewRoles()),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Employee'),
            children: <Widget>[
              ListTile(
                title: const Text('Create Employee'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateEmployee()),
                  );
                },
              ),
              ListTile(
                title: const Text('View Employees'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewEmployees()),
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
