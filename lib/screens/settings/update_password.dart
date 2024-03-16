import 'package:flutter/material.dart';


class UpdatePassword extends StatelessWidget {
  UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Update Password',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}