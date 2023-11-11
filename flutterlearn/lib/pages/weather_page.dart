import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import '../data/weatherdatabase.dart';
import '../models/weather_model.dart';
import '../services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  final _myweatherbox = Hive.box("myweatherbox");
  WeatherDatabase weatherdb = WeatherDatabase();
  final _weatherService = WeatherService('dee2d070f3f11eaf3abf4a200586cefc');
  Weather? _weather;

  // Fetch weather data
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });

      // Save weather data to the database
      weatherdb.weatherdata = [
        {
          'cityName': _weather?.cityName,
          'temperature': _weather?.temperature,
          'mainCondition': _weather?.mainCondition,
        }
      ];
      weatherdb.lastWriteTime = DateTime.now();
      weatherdb.updateData();
    } catch (e) {
      print(e);
    }
  }

  // Check if one hour has passed since the last write
  bool isOneHourPassed() {
    if (weatherdb.lastWriteTime == null) {
      return true; // If the last write time is null, consider it as passed one hour
    }

    var currentTime = DateTime.now();
    return currentTime.difference(weatherdb.lastWriteTime).inMinutes >= 30;
  }





//weather animations
  String getWeatherAnimations(String? mainCondition) {
    if (mainCondition == null) {
      return 'assets/sunny.json';
    } else {
      if(DateTime.now().hour>4 && DateTime.now().hour<20) {
        //day time
        switch (mainCondition.toLowerCase()) {
          case "clouds":
          case "mist":
          case "smoke":
          case "haze":
          case "dust":
          case "fog":
            return 'assets/cloudyday.json';

          case "rain":
          case "drizzle":
          case "shower rain":
            return "assets/sunRain.json";

          case "thunderstorm":
            return "assets/sunthunderstorm.json";
          case "clear":
            return "assets/sunny.json";
          case "default":
            return "assets/sunny.json";
        }
      }else{
        //night time
        switch (mainCondition.toLowerCase()) {
          case "clouds":
          case "mist":
          case "smoke":
          case "haze":
          case "dust":
          case "fog":
            return 'assets/cloudynight.json';

          case "rain":
          case "drizzle":
          case "shower rain":
            return "assets/rainnight.json";

          case "thunderstorm":
            return "assets/thunderstorm.json";
          case "clear":
            return "assets/moon.json";
          case "default":
            return "assets/moon.json";
        }
      }
    }
    return "assets/sunny.json";
  }

  // Init state
  @override
  void initState() {
    if (_myweatherbox.get("WEATHERDATA") == null) {
      weatherdb.createInitialData();
      _fetchWeather();
    } else {
      weatherdb.loadData();
    }

    // Fetch new weather data only if one hour has passed
    if (isOneHourPassed()) {
      _fetchWeather();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Weather',
          style:
              GoogleFonts.handlee(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _fetchWeather,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherdb.weatherdata.isNotEmpty
                  ? weatherdb.weatherdata.first["cityName"] ??
                      "Loading city ..."
                  : "Loading city ...",
              style: GoogleFonts.poppins(
                  fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            // Animation
            Lottie.asset(getWeatherAnimations(weatherdb.weatherdata.isNotEmpty
                ? weatherdb.weatherdata.first["mainCondition"]
                : null)),
            Text(
              weatherdb.weatherdata.isNotEmpty
                  ? weatherdb.weatherdata.first["mainCondition"] ?? ""
                  : "Loading weather ...",
              style: GoogleFonts.dmSans(
                  fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              weatherdb.weatherdata.isNotEmpty
                  ? '${(weatherdb.weatherdata.first["temperature"] as double?)?.round()}°C'
                  : "_°C",
              style:
                  GoogleFonts.montserrat(fontSize: 100.0, color: Colors.white),
            ),
            Text(
              '(Last Updated: ${weatherdb.lastWriteTime?.toString()?.substring(0, 10)}'
                  ', ${weatherdb.lastWriteTime?.toString()?.substring(11, 16) ?? "Not available"})',
              style:
              GoogleFonts.montserrat(fontSize: 15.0, color: Colors.black),
              ),



          ],
        ),
      ),
    );
  }
}
