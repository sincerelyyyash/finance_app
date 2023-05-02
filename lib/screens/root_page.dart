import 'package:finance_app/coinPages/second.dart';
import 'package:finance_app/constraints.dart';
import 'package:finance_app/home_view.dart';
import 'package:finance_app/screens/profile.dart';
import 'package:finance_app/screens/sign_in/login_controller.dart';
import 'package:finance_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../models/api_methods.dart';

class rootpage extends StatefulWidget {
  const rootpage({super.key});

  @override
  State<rootpage> createState() => _rootpageState();
}

class _rootpageState extends State<rootpage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    LearnPage(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Portfolio',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
        ],
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey[500],
        backgroundColor: Colors.white,
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Portfolio Page'),
      ),
    );
  }
}

class LearnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Learn Page'),
      ),
    );
  }
}
