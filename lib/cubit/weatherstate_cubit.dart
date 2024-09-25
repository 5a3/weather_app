import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/modles/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'weatherstate_state.dart';

class WeatherstateCubit extends Cubit<WeatherstateState> {
  WeatherstateCubit(this.weatherService) : super(initdata());
  WeatherService weatherService;

  getweather({required String city}) async {
    emit(lodingstate());
    try {
      WeatherModel weather = await WeatherService().GetWeather(CityName: city);
      emit(lodedstate(weathermodel: weather!));
    } catch (e) {
      emit(errorstate());
    }
  }
}
