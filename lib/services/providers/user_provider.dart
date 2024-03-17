import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/user.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  String url = Api.baseUrl;

  Future<void> updateName(String name) async {}

  Future<void> updateEmail(String newEmail, String password) async {}

  Future<void> updatePassword(String newPassword, String confirmNewPassword) async {}

  Future<void> deleteUser() async {}
}
