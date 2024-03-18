import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/user.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';

// Http
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  String url = Api.baseUrl;

  Future<void> updateName(String name, String id) async {
    try {
      final response = await http.put(
        Uri.parse('$url/user/profile/name/:$id'),
        body: {
          'name': name,
        },
      );

      if (response.statusCode == 200) {
        _user = User.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to update name');
      }
    } catch (e) {
      throw Exception('Failed to update name');
    }
  }

  Future<void> updateEmail(String id, String newEmail, String password) async {
    try {
      final response = await http.put(
        Uri.parse('$url/user/profile/email/:$id'),
        body: {
          'email': newEmail,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        _user = User.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to update email');
      }
    } catch (e) {
      throw Exception('Failed to update email');
    }
  }

  Future<void> updatePassword(
      String id, String newPassword, String confirmNewPassword) async {
    try {
      final response = await http.put(
        Uri.parse('$url/user/profile/password/:$id'),
        body: {
          'newPassword': newPassword,
          'confirmNewPassword': confirmNewPassword,
        },
      );

      if (response.statusCode == 200) {
        _user = User.fromJson(response.body as Map<String, dynamic>);
        notifyListeners();
      } else {
        throw Exception('Failed to update password');
      }
    } catch (e) {
      throw Exception('Failed to update password');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/user/profile/:$id'),
      );

      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      throw Exception('Failed to delete user');
    }
  }
}
