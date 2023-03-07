
import 'package:flutter/cupertino.dart';

import '../models/weather_model.dart';

class Provider_weather extends ChangeNotifier{

  WeatherModel?  _weatherdata;
  String? Cityname;
  set weatherData (WeatherModel? weather){
    _weatherdata=weather;
    notifyListeners();
  }
  WeatherModel?get weatherData =>_weatherdata;
}




