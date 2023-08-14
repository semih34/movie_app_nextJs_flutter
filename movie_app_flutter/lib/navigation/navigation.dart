import 'package:flutter/material.dart';

import '../screens/kids.dart';
import '../screens/movies.dart';
import '../screens/series.dart';
import '../widgets/brand_icon.dart';
import 'navigation_bar_ites.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Widget> screens = [const Movies(), const Series(), const Kids()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0x99000000),
        elevation: 0,
        centerTitle: false,
        title: const BrandIcon(),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.view_list_sharp,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: false,
        onTap: (value) => setState(() {
          if (_currentIndex != value) _currentIndex = value;
        }),
        items: NavigationBarItems.barItems,
        backgroundColor: const Color(0x99000000),
      ),
    );
  }
}
