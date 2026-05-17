import 'package:flutter/material.dart';
import 'package:newsapp/features/Home/Home_screen.dart';
import 'package:newsapp/features/bookmark/bookmark_screen.dart';
import 'package:newsapp/features/profile/profile_screen.dart';
import 'package:newsapp/features/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int _currentibdex = 0;
List<Widget> _screens = [
  HomeScreen(),
  SearchScreen(),
  BookMarkScreen(),
  ProfileScreen(),
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentibdex,
        onTap: (int index) {
          setState(() {
            _currentibdex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_outlined),
            label: "BookMark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: "Profile",
          ),
        ],
      ),
      body: _screens[_currentibdex],
    );
  }
}
