import 'package:flutter/material.dart';


class UpdateEmail extends StatelessWidget {
  UpdateEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Update Email',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
