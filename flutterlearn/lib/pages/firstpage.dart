import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/home_page.dart';
import 'package:flutterlearn/pages/profilepage.dart';
import 'package:flutterlearn/pages/settings_page.dart';

class Firstpage extends StatefulWidget {
  Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  void _navigateBottomBar(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  int _selected_index = 0;

  final List pages = [
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firstpage"),
      ),
      body: pages[_selected_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected_index,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
