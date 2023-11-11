import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/weather_page.dart';
import 'package:flutterlearn/pages/home_page.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int _selected_index = 0;
  final List pages = [
    HomePage(),
    WeatherPage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[_selected_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected_index,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather',
          ),

        ],
      ),
    );
  }
}
