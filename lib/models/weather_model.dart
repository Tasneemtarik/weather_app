// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  String Date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherstate;

  WeatherModel(
      {required this.Date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherstate});

  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        Date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherstate: jsonData['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'date=$Date  temp=$temp  maxTemp=$maxTemp minTemp=$minTemp';
  }

  String getImage() {
    if (weatherstate == 'Clear' || weatherstate == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherstate == 'Sleet' ||
        weatherstate == 'Snow' ||
        weatherstate == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherstate == 'Heavy Cloud' ||
        weatherstate == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherstate == 'Light Rain' ||
        weatherstate == 'Heavy rain' ||
        weatherstate == 'Showers' ||
        weatherstate == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else if (weatherstate == 'Thunderstorm' || weatherstate == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherstate == 'Clear' || weatherstate == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherstate == 'Sleet' ||
        weatherstate == 'Snow' ||
        weatherstate == 'Hail') {
      return Colors.blue;
    } else if (weatherstate == 'Heavy Cloud' ||
        weatherstate == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherstate == 'Light Rain' ||
        weatherstate == 'Heavy rain' ||
        weatherstate == 'Showers' ||
        weatherstate == 'Patchy rain possible') {
      return Colors.blue;
    } else if (weatherstate == 'Thunderstorm' || weatherstate == 'Thunder') {
      return Colors.blueGrey;
    } else {
      return Colors.orange;
    }
  }
}
