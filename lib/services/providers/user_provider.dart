import 'package:flutter/material.dart';

// Models
import 'package:flutter_cms_business_manager/services/models/user.dart';

// Api
import 'package:flutter_cms_business_manager/services/api.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  String url = Api.baseUrl;

  Future<void> updateEmail(String email) async {}

  Future<void> updatePassword(String password) async {}

  Future<void> deleteUser() async {}
}
