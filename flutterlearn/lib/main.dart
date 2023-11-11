import 'package:flutter/material.dart';
import 'package:flutterlearn/pages/firstpage.dart';
import 'package:flutterlearn/pages/home_page.dart';
import 'package:flutterlearn/pages/weather_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("mybox");
  var wbox = await Hive.openBox("myweatherbox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(57, 147, 221, 1.0);

    // Create a MaterialColor using the custom color
    MaterialColor customSwatch = MaterialColor(
      customColor.value,
      <int, Color>{
        50: customColor,
        100: customColor,
        200: customColor,
        300: customColor,
        400: customColor,
        500: customColor,
        600: customColor,
        700: customColor,
        800: customColor,
        900: customColor,
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      theme: ThemeData(
          primarySwatch: customSwatch,
          textTheme: TextTheme(titleSmall: GoogleFonts.roboto())),
      routes: {
        '/weatherpage':(context)=>WeatherPage(),
        '/homepage':(context)=>HomePage(),
      },
    ); //default color
  }
}
