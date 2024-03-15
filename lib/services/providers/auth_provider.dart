import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/user.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  String url = Api.baseUrl;

  Future<void> createUser(String email, String password) async {}

  Future<void> login(String email, String password) async {}

  Future<void> forgotPassword(String email, String password) async {}

  Future<void> resetPassword(String email, String password) async {}

  Future<void> logout() async {}

}
