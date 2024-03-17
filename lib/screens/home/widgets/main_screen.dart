import 'package:flutter/material.dart';

// Widgets
import 'package:flutter_cms_business_manager/common/widgets/custom_bottom_bar.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/home/home.dart';
import 'package:flutter_cms_business_manager/screens/settings/settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final pages = [
    const Home(),
    const Settings(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}
