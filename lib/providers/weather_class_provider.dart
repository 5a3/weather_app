import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../modles/weather_model.dart';

class weather_class_provider extends ChangeNotifier {
  WeatherModel? _weatherdata;
  WeatherModel? get weatherdata => _weatherdata;

  Future<dynamic> getWeatherData(String city) async {
    try {
      _weatherdata = await WeatherService().GetWeather(CityName: city);
      notifyListeners();
    } catch (e) {
      print("Error----->${e}");
    }
    // String city = "London"; // default city
  }
}
