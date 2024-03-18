import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/department.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';
import 'package:flutter_cms_business_manager/services/models/employee.dart';
import 'package:flutter_cms_business_manager/services/models/role.dart';

// Http
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class CMSProvider extends ChangeNotifier {
  List<Department> _department = [];
  List<Department> _departments = [];
  List<Role> _roles = [];
  List<Employee> _employees = [];
  Employee? _employee;
  late Role _role;

  List<Department> get department => _department;
  List<Role> get roles => _roles;

  String url = Api.baseUrl;

  Future<void> createDepartment(String departmentName) async {
    try {
      final response = await http.post(
        Uri.parse('$url/cms/department'),
        body: {
          'name': departmentName,
        },
      );

      if (response.statusCode == 201) {
        _department.add(Department.fromJson(jsonDecode(response.body)));
        notifyListeners();
      } else {
        throw Exception('Failed to create department');
      }
    } catch (e) {
      throw Exception('Failed to create department');
    }
  }

  Future<void> deleteDepartment(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/cms/department/$id'),
      );

      if (response.statusCode == 200) {
        _department.removeWhere((department) => department.id == id);
        notifyListeners();
      } else {
        throw Exception('Failed to delete department');
      }
    } catch (e) {
      throw Exception('Failed to delete department');
    }
  }

  Future<void> updateDepartment(String id, String departmentName) async {
    try {
      final response = await http.put(
        Uri.parse('$url/cms/department/$id'),
        body: {
          'name': departmentName,
        },
      );

      if (response.statusCode == 200) {
        var list = jsonDecode(response.body) as List;
        _department = list.map((item) => Department.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to update department');
      }
    } catch (e) {
      throw Exception('Failed to update department');
    }
  }

  Future<List<Department>> getDepartments({String? name}) async {
    try {
      final response = await http.get(
        Uri.parse('$url/cms/department${name != null ? '?name=$name' : ''}'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> departmentList = jsonDecode(response.body);
        _departments =
            departmentList.map((i) => Department.fromJson(i)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to get departments');
      }
    } catch (e) {
      throw Exception('Failed to get departments');
    }

    return _departments;
  }

  Future<void> getDepartment(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/cms/department/$id'),
      );

      if (response.statusCode == 200) {
        _department.add(Department.fromJson(jsonDecode(response.body)));
        notifyListeners();
      } else {
        throw Exception('Failed to get department');
      }
    } catch (e) {
      throw Exception('Failed to get department');
    }
  }

  Future<void> createRole(
      String jobTitle, String salary, String department) async {
    try {
      final response = await http.post(
        Uri.parse('$url/cms/role'),
        body: {
          'jobTitle': jobTitle,
          'salary': salary,
          'department': department,
        },
      );

      if (response.statusCode == 201) {
        _roles.add(Role.fromJson(jsonDecode(response.body)));
        notifyListeners();
      } else {
        throw Exception('Failed to create role');
      }
    } catch (e) {
      throw Exception('Failed to create role');
    }
  }

  Future<List<Role>> getRoles() async {
    try {
      final response = await http.get(
        Uri.parse('$url/cms/role'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> roleList = jsonDecode(response.body);
        _roles = roleList.map((i) => Role.fromJson(i)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to get roles');
      }
    } catch (e) {
      throw Exception('Failed to get roles');
    }

    return _roles;
  }

  Future<void> getRole(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/cms/role/$id'),
      );

      if (response.statusCode == 200) {
        _role = Role.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to get role');
      }
    } catch (e) {
      throw Exception('Failed to get role');
    }
  }

  Future<void> deleteRole(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/cms/role/$id'),
      );

      if (response.statusCode == 200) {
        _role = Role.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to delete role');
      }
    } catch (e) {
      throw Exception('Failed to delete role');
    }
  }

  Future<void> updateRole(
      String id, String jobTitle, String salary, String department) async {
    try {
      final response = await http.put(
        Uri.parse('$url/cms/role/$id'),
        body: {
          'jobTitle': jobTitle,
          'salary': salary,
          'department': department,
        },
      );

      if (response.statusCode == 200) {
        _role = Role.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to update role');
      }
    } catch (e) {
      throw Exception('Failed to update role');
    }
  }

  Future<void> createEmployee(
      String name, String role, String department) async {
    try {
      final response = await http.post(
        Uri.parse('$url/cms/employee'),
        body: {
          'name': name,
          'role': role,
          'department': department,
        },
      );

      if (response.statusCode == 201) {
        _employee = Employee.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to create employee');
      }
    } catch (e) {
      throw Exception('Failed to create employee');
    }
  }

  Future<List<Employee>> getEmployees({String? role}) async {
    try {
      final response = await http.get(
        Uri.parse('$url/cms/employee'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> employeeList = jsonDecode(response.body);
        _employees = employeeList.map((i) => Employee.fromJson(i)).toList();
        if (role != null) {
          _employees =
              _employees.where((employee) => employee.role == role).toList();
        }
        notifyListeners();
      } else {
        throw Exception('Failed to get employees');
      }
    } catch (e) {
      throw Exception('Failed to get employees');
    }

    return _employees;
  }

  Future<void> getEmployee(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$url/cms/employee/$id'),
      );

      if (response.statusCode == 200) {
        _employee = Employee.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to get employee');
      }
    } catch (e) {
      throw Exception('Failed to get employee');
    }
  }

  Future<void> deleteEmployee(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/cms/employee/$id'),
      );

      if (response.statusCode == 200) {
        _employee = Employee.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to delete employee');
      }
    } catch (e) {
      throw Exception('Failed to delete employee');
    }
  }

  Future<void> updateEmployee(
      String id, String name, String role, String department) async {
    try {
      final response = await http.put(
        Uri.parse('$url/cms/employee/$id'),
        body: {
          'name': name,
          'role': role,
          'department': department,
        },
      );

      if (response.statusCode == 200) {
        _employee = Employee.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to update employee');
      }
    } catch (e) {
      throw Exception('Failed to update employee');
    }
  }
}
