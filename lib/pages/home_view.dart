import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubit/weatherstate_cubit.dart';
import 'package:weather_app/cubit/weatherstate_state.dart';
import 'package:weather_app/modles/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_class_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class homepage extends StatelessWidget {
  homepage({Key? key}) : super(key: key);

  // WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('Weather App'),
        ),
        body: BlocBuilder<WeatherstateCubit, WeatherstateState>(
            builder: (context, state) {
          if (state is lodingstate) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is lodedstate) {
            return bodyweatherpage(weather: state.weathermodel);
          } else if (state is errorstate) {
            return Center(
              child: Text('No Data Now Please Try Agine'),
            );
          }
          return NoWeatherBody();
          //
        }));

    //  BlocBuilder<WeatherstateCubit, WeatherstateState>(
    //   builder: (context, state) {
    //     if (state is lodingstate) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (state is lodedstate) {
    //       WeatherModel weatherdata =
    //           BlocProvider.of<WeatherstateCubit>(context).weather!;
    //       return bodyweatherpage(weather: weatherdata);
    //     } else if (state is errorstate) {
    //       return Center(
    //         child: Text('No Data Now Please Try Agine'),
    //       );
    //     } else {
    //       return NoWeatherBody();
    //     }
    //   },
    // ));
    // ? NoWeatherBody()
    // : bodyweatherpage());
  }
}

class bodyweatherpage extends StatelessWidget {
  bodyweatherpage({
    required this.weather,
    super.key,
  });
  WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                "${weather!.city}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                "${weather!.date}",
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
                        "درجه الحراره العظمئ:${weather!.tempMax}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("درجه الحراره الصغرئ:${weather!.tempMin}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Image.network("${weather!.iconState}"),
                  Text(
                    "${weather!.temp}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                "${weather!.weatherState}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
