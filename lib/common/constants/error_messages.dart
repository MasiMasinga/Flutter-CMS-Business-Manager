import 'package:flutter/material.dart';

class ValidationMessages {
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Invalid email';
  static const String invalidPassword = 'Invalid password';
  static const String invalidPasswordDoNotMatch = 'Passwords do not match';
  static const String invalidName = 'Invalid name';
}

class NotificationMessages {
  static const authFailed = "Invalid email or password provided";
  static const authSuccess = "Authentication successful";
  static const authError = "An error occurred while authenticating";
  static const userExists = "User already exists";
  static const userDoesNotExist = "User does not exist";
  static const resetPasswordEmailSent = "Password reset email sent";
  static const passwordResetError = "An error occurred while resetting password";
  static const passwordResetSuccess = "Password reset successful";
}
