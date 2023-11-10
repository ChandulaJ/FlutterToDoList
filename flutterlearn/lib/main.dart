import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(titleSmall: GoogleFonts.roboto())),
    ); //default color
  }
}
