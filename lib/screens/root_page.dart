import 'package:finance_app/constraints.dart';
import 'package:finance_app/home_view.dart';
import 'package:finance_app/markets.dart';
import 'package:finance_app/screens/profile.dart';
import 'package:finance_app/screens/profilepage.dart';

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
    Markets(),
    LearnPage(),
    ProfilePage()
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
            icon: Icon(Icons.book_online_rounded),
            label: 'Markets',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_rounded),
            label: 'Portfolio',
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
