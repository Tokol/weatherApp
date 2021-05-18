import 'dart:convert';

import 'package:flutter_app/models/Weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherApp {
  static final String appKey = "ur key";

  static final WeatherApp weatherApp = WeatherApp.internal();

      WeatherApp.internal();


      factory WeatherApp(){

        return weatherApp;

      }






  Future<Position> getLocation() async {
  try{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    return position;
  }


  catch(e){
    print('user location error');
  }
  }

  Future<Weather> requestWeatherFromLatLon(
      double userLattitude, double userLognitude) async {

    try{
      String requesUrl =
          "https://api.openweathermap.org/data/2.5/weather?lat=$userLattitude&lon=$userLognitude&appid=$appKey&units=metric";
      var url = Uri.parse(requesUrl);

      http.Response response;

      response = await http.get(url);

      var result = json.decode(response.body);

      Weather weather = Weather(
          temp: result["main"]["temp"],
          wind: result["wind"]["speed"],
          humid: result["main"]["humidity"],
          condition : result["weather"][0]["description"],
          location: result["name"]

      );

      return weather;
    }

    catch(e){

      return null;


    }







  }
}
