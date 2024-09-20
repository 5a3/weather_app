import 'package:flutter/material.dart';
import 'package:weather_app/modles/weather_model.dart';
import 'package:weather_app/providers/weather_class_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:provider/provider.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
//instance form class weather

  WeatherService _weatherService = new WeatherService();
  // WeatherModel? _weatherData;

  // @override
  // void initState() {
  //   super.initState();
  //   _getWeatherData();
  // }

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  String? CityName;
  TextEditingController City = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search City"),
        ),
        body: Center(
          child: Consumer<weather_class_provider>(
            builder: (context, value, child) {
              var weather2 = Provider.of<weather_class_provider>(context);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent)),
                      Text("City",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(176, 13, 70, 0.589))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: City,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return " الرجاء ادخال المدينة";
                              } else {
                                return null;
                              }
                            },
                            // onChanged: (val) {
                            //   CityName = val;
                            //   print(CityName);
                            // },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Enter City',
                                hintText: "City Name",
                                prefixIcon: Icon(Icons.location_city)),
                          ),
                          MaterialButton(
                            child: Text(
                              "بحث",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.blueAccent,
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                weather2.getWeatherData("${City.text}");
                                Navigator.of(context).pop();
                              }
                              // if (_formkey.currentState!.validate()) {
                              //   _weatherData = await _weatherService.GetWeather(
                              //       CityName: "${City.text}");

                              //   print(CityName);
                              //   // CityName = City.text;
                              // }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
