import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/department.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';

class CMSProvider extends ChangeNotifier {
  Department? _department;

  Department? get user => _department;

  String url = Api.baseUrl;
  

  Future<void> createDepartment(String departmentName) async {}

  Future<void> deleteDepartment(String id) async {}

  Future<void> updateDepartment(String id, String departmentName) async {}

  Future<void> getDepartments() async {}

  Future<void> getDepartment(String id) async {}



  Future<void> createRole(
      String jobTitle, String salary, String department) async {}

  Future<void> getRoles() async {}

  Future<void> getRole(String id) async {}

  Future<void> deleteRole(String id) async {}

  Future<void> updateRole(
      String id, String jobTitle, String salary, String department) async {}



  Future<void> createEmployee(
      String name, String role, String department) async {}

  Future<void> getEmployees() async {}

  Future<void> getEmployee(String id) async {}

  Future<void> deleteEmployee(String id) async {}

  Future<void> updateEmployee(
      String id, String name, String role, String department) async {}

}
