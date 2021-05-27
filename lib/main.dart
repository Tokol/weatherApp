import 'package:flutter/material.dart';
import 'package:flutter_app/corona_screen.dart';
import 'package:flutter_app/splash_screen.dart';
import 'package:flutter_app/weather_home.dart';

import 'bmi.dart';
import 'city_screen.dart';
import 'const/const.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      primaryColor:kThemeColor,
      scaffoldBackgroundColor: kThemeColor,

    ),

    home: BMIAPP(),

    );
  }
}


