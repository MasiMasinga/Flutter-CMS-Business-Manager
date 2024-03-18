import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';
import 'package:flutter_cms_business_manager/common/widgets/snack_bar.dart';

// Widgets
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';
import 'package:flutter_cms_business_manager/services/models/department.dart';
import 'package:flutter_cms_business_manager/services/models/employee.dart';
import 'package:flutter_cms_business_manager/services/models/role.dart';

// Provider
import 'package:flutter_cms_business_manager/services/providers/cms_provider.dart';
import 'package:provider/provider.dart';

class ViewEmployees extends StatefulWidget {
  const ViewEmployees({super.key});

  @override
  State<ViewEmployees> createState() => _ViewEmployeesState();
}

class _ViewEmployeesState extends State<ViewEmployees> {
  String filterRole = 'All';
  String filterDepartment = 'All';
  List<Employee> employees = [];
  List<Role> roles = [];
  List<Department> departments = [];

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  fetchInitialData() async {
    final cmsProvider = Provider.of<CMSProvider>(context, listen: false);
    employees = await cmsProvider.getEmployees();
    roles = await cmsProvider.getRoles();
    departments = await cmsProvider.getDepartments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cmsProvider = Provider.of<CMSProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Employees'),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
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
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              setState(() {
                filterRole = value;
              });
              employees = await cmsProvider.getEmployees(role: value);
            },
            itemBuilder: (context) {
              return roles.map((Role role) {
                return PopupMenuItem<String>(
                  value: role.jobTitle,
                  child: Text('Role: ${role.jobTitle}'),
                );
              }).toList();
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              setState(() {
                filterDepartment = value;
              });
              departments = await cmsProvider.getDepartments(name: value);
            },
            itemBuilder: (context) {
              return departments.map((Department department) {
                return PopupMenuItem<String>(
                  value: department.name,
                  child: Text('Department: ${department.name}'),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Employee>>(
        future: cmsProvider.getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'An error occurred while fetching employees. Please try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          } else {
            final employees = snapshot.data!;
            return ListView(
              children: employees.where((employee) {
                return (filterRole == 'All' || employee.role == filterRole) &&
                    (filterDepartment == 'All' ||
                        employee.department == filterDepartment);
              }).map((employee) {
                return ListTile(
                  title: Text(employee.name),
                  subtitle: Text(
                      'Role: ${employee.role}, Department: ${employee.department}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          cmsProvider.deleteEmployee(employee.id);

                          CustomSnackBar.show(
                            context,
                            'Employee Deleted Successfully',
                            backgroundColor: AppColors.lightRed,
                            textColor: AppColors.white,
                          );

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
                    ],
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
