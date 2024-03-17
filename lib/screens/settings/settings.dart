import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
