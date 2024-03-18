import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/user.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';

// Http
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  String url = Api.baseUrl;

  Future<void> createUser(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:6000/api/auth/register'),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      _user = User.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$url/auth/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        _user = User.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login');
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$url/auth/forgot-password'),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        throw Exception('Failed to send reset password email');
      }
    } catch (e) {
      throw Exception('Failed to send reset password email');
    }
  }

  Future<void> resetPassword(
      String newPassword, String confirmNewPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$url/auth/reset-password'),
        body: {
          'newPassword': newPassword,
          'confirmNewPassword': confirmNewPassword,
        },
      );

      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        throw Exception('Failed to reset password');
      }
    } catch (e) {
      throw Exception('Failed to reset password');
    }
  }

  Future<void> logout() async {
    try {
      final response = await http.post(
        Uri.parse('$url/auth/logout'),
      );

      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        throw Exception('Failed to logout');
      }
    } catch (e) {
      throw Exception('Failed to logout');
    }
  }
}
