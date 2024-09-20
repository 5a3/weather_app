import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather_app/modles/weather_model.dart';

class WeatherService {
  var ApiKey = "ab600bab16964bb7a2695109242107";
  var baseUrl = "http://api.weatherapi.com/v1";
  Future GetWeather({required String CityName}) async {
    var url =
        "${baseUrl}/forecast.json?key=${ApiKey}&q=${CityName}&days=6&aqi=no&alerts=no";
    // var url =
    //     "${baseUrl}/current.json?key=${ApiKey}&q=${CityName}&days=6&aqi=no&alerts=no";
    var response = await http.get(Uri.parse(url));
    var res_body = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromjson(res_body);
    // print(weather);
    return weather;

    // String date = res_body['location']['localtime'].toString();
    // String city = res_body['location']['name'].toString();
    // double temp_c = res_body['current']['temp_c'];
    // double avgtemp_c = res_body['forecast']['forecastday'][0]['avgtemp_c'];
    // double maxtemp_c = res_body['forecast']['forecastday'][0]['maxtemp_c'];
    // double mintemp_c = res_body['forecast']['forecastday'][0]['mintemp_c'];
    // String WeatherState =
    //     res_body['forecast']['forecastday'][0]['condition']['text'].toString();

    // WeatherModel weather = new WeatherModel(
    //     date: date,
    //     city: city,
    //     temp: avgtemp_c,
    //     tempMin: mintemp_c,
    //     tempMax: maxtemp_c,
    //     WeatherState: WeatherState, iconstate: '');

    // return weather;
  }
}
