import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';
import '../services/weather_services.dart';

class WeatherPage extends StatefulWidget {

   WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _myweatherbox = Hive.box("myweatherbox");
  //WeatherDatabase weatherdb = WeatherDatabase();

//api key

  final _weatherService = WeatherService('dee2d070f3f11eaf3abf4a200586cefc');
  Weather? _weather;

  //fetch weather data
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  //weather animations
  String getWeatherAnimations(String? mainCondition) {
    if (mainCondition == null){ return 'assets/sunny.json';}
    else {
      switch (mainCondition.toLowerCase()) {
        case "clouds":
        case "mist":
        case "smoke":
        case "haze":
        case "dust":
        case "fog":
          return 'assets/cloudy.json';

        case "rain":
        case "drizzle":
        case "shower rain":
          return "assets/sunRain.json";

        case "thunderstorm":
          return "assets/thunderstorm.json";
        case "clear":
          return "assets/sunny.json";
        case "default":
          return "assets/sunny.json";
      }
    }
    return "assets/sunny.json";
  }

  //init state

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
            child: Text('WEATHER'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "Loading city ...",style: GoogleFonts.poppins(fontSize: 30.0,fontWeight: FontWeight.bold),),
            //animation
            Lottie.asset(getWeatherAnimations(_weather?.mainCondition)),
            Text(_weather?.mainCondition ?? "",style: GoogleFonts.dmSans(fontSize: 30.0,fontWeight: FontWeight.bold),),
SizedBox(height: 20.0,),
            Text('${_weather?.temperature.round()}°C',style: GoogleFonts.montserrat(fontSize: 100.0,color: Colors.white),),



          ],
        ),

      ),

    );
  }
}
