import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/firstpage.dart';
import 'package:flutterlearn/pages/home_page.dart';
import 'package:flutterlearn/pages/profilepage.dart';
import 'package:flutterlearn/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Firstpage(),
      routes: {
        '/settingspage': (context) => SettingsPage(),
        '/homepage': (context) => HomePage(),
        '/firstpage': (context) => Firstpage(),
      },
    );
  }
}
