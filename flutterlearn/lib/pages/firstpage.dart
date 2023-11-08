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
      body: Center(
        child: ElevatedButton(
          child: Text("second page"),
          onPressed: () {
            Navigator.pushNamed(context, "/secondpage");
          },
        ),
      ),
    );
  }
}
