import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatther/pages/search_page.dart';

import '../models/weather_model.dart';
import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? WeatherData;
  @override
  Widget build(BuildContext context) {
    WeatherData =Provider.of<Provider_weather>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: const Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body:WeatherData==null?
      Center(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(
              child: Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      ): Container(
        decoration: BoxDecoration(gradient :LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [WeatherData!.getThemeColor(),WeatherData!.getThemeColor()[300]!,WeatherData!.getThemeColor()[100]!])),
        // color: WeatherData!.getThemeColor(),
        child: Center(
          child:Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [    Spacer(),
              Text(
                Provider.of<Provider_weather>(context).Cityname!,style:
              TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold),),
              Text(
                  'updated at :  ${WeatherData!.Date.toString()}'  ,style:
              TextStyle(
                fontSize: 22,
              )
              )
              ,Spacer(),
              Row(
                children:  [
                  Spacer(),
                  SizedBox(width: 35,height: 35,
                      child: Image.asset(WeatherData!.getImage())),
                  Spacer(),
                  Text(
                    WeatherData!.temp.toInt().toString(),style:
                  TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold),),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                          'maxTemp: ${WeatherData!.maxTemp.toInt()} ',style:
                      TextStyle(
                        fontSize: 32,
                      )),
                      Text(
                          'minTemp: ${WeatherData!.minTemp.toInt()} ',style:
                      TextStyle(
                        fontSize: 32,
                      )),
                    ],


                  )

                ],)
              ,Padding(
              padding: const EdgeInsets.only(top:50,left: 20),
              child: Text(
                WeatherData!.weatherstate.toString(),style:
              TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold),),
            ),
              Spacer(flex:1)
            ],)
        ),
      ),
    );
  }
}
