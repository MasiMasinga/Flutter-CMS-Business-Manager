import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
