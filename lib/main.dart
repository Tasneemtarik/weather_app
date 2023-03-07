import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatther/pages/home_page.dart';
import 'package:weatther/pages/login_page.dart';
import 'package:weatther/pages/search_page.dart';
import 'package:weatther/providers/weather_provider.dart';


void main() {
  runApp( ChangeNotifierProvider(
      create: (context){
        return Provider_weather();
      },child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme:ThemeData(
        primarySwatch: Provider.of<Provider_weather>(context).weatherData==null? Colors.orange:Provider.of<Provider_weather>(context).weatherData!.getThemeColor(),
        // brightness: Brightness.dark
      ) ,

      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routes: {
        '/login':(context){
          return login();
        },
        '/home':(context){
          return HomePage();
        },
        '/search':(context){
          return SearchPage();
        }
      },
      initialRoute:'/login' ,
    );
  }
}
