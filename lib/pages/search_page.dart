import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';
import '../services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? Cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
              onChanged: (data) {
                Cityname = data;
              },
              onSubmitted: (data) async {
                Cityname = data;
                WeatherService service = WeatherService();
                WeatherModel weather =
                await service.getweather(Cityname: Cityname!);

                Provider.of<Provider_weather>(context, listen: false)
                    .weatherData = weather;
                Provider.of<Provider_weather>(context, listen: false).Cityname =
                    Cityname;

                Navigator.pop(context);
                // print (weather);
                // print(data);
              },
              decoration: InputDecoration(
                  hintText: 'Enter A City',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        WeatherService service = WeatherService();
                        WeatherModel weather =
                        await service.getweather(Cityname: Cityname!);

                        Provider.of<Provider_weather>(context, listen: false)
                            .weatherData = weather;
                        Provider.of<Provider_weather>(context, listen: false)
                            .Cityname = Cityname;

                        Navigator.pop(context);
                      },
                      child: Icon(Icons.search)),
                  label: Text('City'))),
        ),
      ),
    );
  }
}
