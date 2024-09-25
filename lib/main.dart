import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weatherstate_cubit.dart';
import 'package:weather_app/pages/home_view.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_class_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

void main() {
  runApp(BlocProvider<WeatherstateCubit>(
    create: (context) => WeatherstateCubit(WeatherService()),
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
