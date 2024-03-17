import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

// Widgets
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';
import 'package:flutter_cms_business_manager/services/models/employee.dart';

class ViewEmployees extends StatefulWidget {
  const ViewEmployees({super.key});

  @override
  State<ViewEmployees> createState() => _ViewEmployeesState();
}

class _ViewEmployeesState extends State<ViewEmployees> {
  String filterRole = 'All';
  String filterDepartment = 'All';

  List<Employee> employees = [
    Employee(name: 'John Doe', role: 'Developer', department: 'IT'),
    Employee(name: 'Jane Smith', role: 'Designer', department: 'Marketing'),
    Employee(name: 'Bob Johnson', role: 'Manager', department: 'HR'),
    Employee(name: 'Alice Williams', role: 'Developer', department: 'IT'),
    Employee(name: 'Charlie Brown', role: 'Designer', department: 'Marketing'),
    Employee(name: 'David Davis', role: 'Manager', department: 'HR'),
  ];

  @override
  Widget build(BuildContext context) {
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
            onSelected: (value) {
              setState(() {
                filterRole = value;
              });
            },
            itemBuilder: (context) {
              return ['All', 'Developer', 'Designer'].map((String role) {
                return PopupMenuItem<String>(
                  value: role,
                  child: Text('Role: $role'),
                );
              }).toList();
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                filterDepartment = value;
              });
            },
            itemBuilder: (context) {
              return ['All', 'IT', 'HR'].map((String department) {
                return PopupMenuItem<String>(
                  value: department,
                  child: Text('Department: $department'),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView(
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
                  onPressed: () {},
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
