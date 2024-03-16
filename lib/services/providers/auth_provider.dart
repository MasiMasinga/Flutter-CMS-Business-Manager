import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/user.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  String url = Api.baseUrl;

  Future<void> createUser(String name, String email, String password) async {}

  Future<void> login(String email, String password) async {}

  Future<void> forgotPassword(String email) async {}

  Future<void> resetPassword(String newPassword, String confirmNewPassword) async {}

  Future<void> logout() async {}
}
