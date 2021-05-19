import 'package:flutter/material.dart';
import 'package:flutter_app/weather_app.dart';
import 'package:flutter_app/weather_home.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  WeatherApp _weatherApp = WeatherApp();



  void getWeather() async {

    Position position = await _weatherApp.getLocation();

    var result = await _weatherApp.requestWeatherFromLatLon(position.latitude, position.longitude);

    print(result);

    if(result!=null){

      Navigator.pushReplacementNamed(context, 'home');

    }


    else{
      print('Requesst error');
    }



  }

  @override
  void initState() {
    // TODO: implement initState
    getWeather();

    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(


        child: CircularProgressIndicator(
          backgroundColor: Colors.amber,
          value: 30.0,

        ),
      ),
    );
  }
}
