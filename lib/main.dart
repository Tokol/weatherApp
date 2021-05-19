import 'package:flutter/material.dart';
import 'package:flutter_app/splash_screen.dart';
import 'package:flutter_app/weather_home.dart';

import 'city_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
    '/': (context)=>SplashScreen(),
    'home':(context)=>WeatherHome(),
     'city':(context)=>CityScreen(),
    },


    );
  }
}

