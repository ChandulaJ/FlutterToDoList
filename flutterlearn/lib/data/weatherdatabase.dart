
import 'package:hive/hive.dart';

class WeatherDatabase {
  final _myweatherbox = Hive.box("myweatherbox");
  List weatherdata = [];
  late DateTime lastWriteTime;

  // Create initial data
  void createInitialData() {
    weatherdata = [];
    lastWriteTime = DateTime.now();
  }

  // Load data from the database
  void loadData() {
    weatherdata = _myweatherbox.get("WEATHERDATA") ?? [];
    lastWriteTime = _myweatherbox.get("LAST_WRITE_TIME") ?? DateTime.now();
  }

  // Update data
  void updateData() {
    _myweatherbox.put("WEATHERDATA", weatherdata);
    _myweatherbox.put("LAST_WRITE_TIME", lastWriteTime);
  }
}
