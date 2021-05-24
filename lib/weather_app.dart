import 'dart:convert';

import 'package:flutter_app/models/Weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherApp {

  static final WeatherApp _weatherApp = WeatherApp.internal();
  WeatherApp.internal();

  Weather weather;

  factory WeatherApp(){
    return _weatherApp;
  }


  static final String appKey = "eb41ad944236215dc78c4ad4c914177f";

  Future<Position> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      return position;
    } catch (e) {
      print('user location error');
    }
  }

  Future<Weather> requestWeatherFromLatLon(
      double userLattitude, double userLognitude) async {
    String requesUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$userLattitude&lon=$userLognitude&appid=$appKey&units=metric";

     weather = await getResponse(requesUrl);

    return weather;
  }



  Future<Weather> requestWeatherByCityName(String cityName) async {
    String requesUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appKey&units=metric";
     weather = await getResponse(requesUrl);
    return weather;
  }

  Future<Weather> getResponse(String requestURl) async {
    try {
      var url = Uri.parse(requestURl);

      http.Response response;

      response = await http.get(url);

      var result = json.decode(response.body);

      Weather weather = Weather(
          temp: result["main"]["temp"],
          wind: (result["wind"]["speed"]).toString(),
          humid: (result["main"]["humidity"]).toString(),
          condition: result["weather"][0]["description"],
          location: result["name"]);

      return weather;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
