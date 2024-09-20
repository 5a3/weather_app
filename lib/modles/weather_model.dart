class WeatherModel {
  String? iconState;
  String? date;
  String? city;
  double? temp;
  double? tempMin;
  double? tempMax;
  String? weatherState;

  WeatherModel({
    this.iconState,
    this.date,
    this.city,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.weatherState,
  });

  factory WeatherModel.fromjson(Map<String, dynamic> json) {
    final dayData = json['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      iconState: "https:${json['current']['condition']['icon']}",
      date: json['location']['localtime'],
      city: json['location']['name'],
      temp: json != null ? json['current']['temp_c']?.toDouble() : null,
      tempMin: dayData != null ? dayData['mintemp_c']?.toDouble() : null,
      tempMax: dayData != null ? dayData['maxtemp_c']?.toDouble() : null,
      weatherState: json['current']['condition']['text'],
    );
  }
  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconState'] = this.iconState;
    data['date'] = this.date;
    data['city'] = this.city;
    // data['temp'] = this.temp;
    // data['tempMin'] = this.tempMin;
    // data['tempMax'] = this.tempMax;
    data['weatherState'] = this.weatherState;
    return data;
  }
}
