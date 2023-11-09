import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/secondpage.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firstpage"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(
          children: [
            DrawerHeader(
                child: Icon(
                  Icons.face,
                  size: 48.0,
                )),
            ListTile(
                leading: Icon(Icons.home),
                title: Text("HOME"),
                onTap: () {
                  //pop drawer
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/homepage');
                }),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text("SETTINGS"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settingspage');
                })
          ],
        ),
      ),
    );
  }
}
