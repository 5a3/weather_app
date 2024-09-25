import 'package:weather_app/modles/weather_model.dart';

abstract class WeatherstateState {}

class initdata extends WeatherstateState {}

class lodingstate extends WeatherstateState {}

class lodedstate extends WeatherstateState {
  WeatherModel weathermodel;
  lodedstate({required this.weathermodel});
}

class errorstate extends WeatherstateState {}
