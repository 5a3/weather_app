import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_view.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_class_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<weather_class_provider>(
    create: (context) => weather_class_provider(),
    // builder: (context, child) => Container(),
    child: WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
