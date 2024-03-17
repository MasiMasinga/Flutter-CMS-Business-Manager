import 'package:flutter/material.dart';

// Widgets
import 'package:flutter_cms_business_manager/common/widgets/custom_bottom_bar.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/home/home.dart';
import 'package:flutter_cms_business_manager/screens/settings/settings.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({required Key key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  var pages = [
    const Home(),
    const Settings(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _currentIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}
