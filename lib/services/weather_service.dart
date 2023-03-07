import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  // ignore: non_constant_identifier_names
  Future<WeatherModel> getweather({required String Cityname}) async {
    String apiKey = ' 26cc1f8d82044e4eaf2234039221412';
    String baseUrl = 'http://api.weatherapi.com';

    Uri url = Uri.parse(
        '$baseUrl/v1/forecast.json?key=$apiKey &q=$Cityname&days=1&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    //print(data);

    WeatherModel weather = WeatherModel.fromjson(data);
    return weather;
  }
}
//http://api.weatherapi.com/v1/forecast.json?key=1514733536135fc52c90ad22538e2ef0&q=cairo&days=1&aqi=no&alerts=no