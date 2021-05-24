import 'dart:convert';

import 'package:http/http.dart' as http;

import 'end_points.dart';

class Network {
  String country;
  Network({this.country});

  Future<dynamic> getCoronaSummary() async {
    if (country == null) {
      country = "Nepal";
    }

    try {
      http.Response response;

      response = await http.get(requestSummary(country), headers: {"x-rapidapi-key":"757d02bda2msh9c9ccec72b99b9dp11907djsn658419b200ca"});

      var result = json.decode(response.body);
      return result;
    } catch (e) {
      print('somewthing went wrong');
    }
  }

  Future<dynamic> getHospitalList() async {
    try {
      http.Response response;
      response = await http.get(requestNepal(hospitalEndpoints));

      var result = json.decode(response.body);

    } catch (e) {
      print('somewthing went wrong');
    }
  }

  Future<dynamic> getmyths() async {
    try {
      http.Response response;
      response = await http.get(requestNepal(mythEndpoints));

      var result = json.decode(response.body);
    } catch (e) {
      print('somewthing went wrong');
    }
  }
}
