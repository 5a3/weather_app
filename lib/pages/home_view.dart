import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/modles/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_class_provider.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class homepage extends StatelessWidget {
  homepage({Key? key}) : super(key: key);

  // WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Consumer<weather_class_provider>(
      builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return searchpage();
                      },
                    ));
                  },
                  icon: Icon(Icons.search))
            ],
            title: const Text('Weather App'),
          ),
          body: value.weatherdata == null
              ? NoWeatherBody()
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    color: Color.fromARGB(245, 255, 191, 41),
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            "${value.weatherdata!.city}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            "${value.weatherdata!.date}",
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "درجه الحراره العظمئ:${value.weatherdata!.tempMax}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "درجه الحراره الصغرئ:${value.weatherdata!.tempMin}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Image.network("${value.weatherdata!.iconState}"),
                              Text(
                                "30°C",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            "${value.weatherdata!.weatherState}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Spacer(
                            flex: 4,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}
