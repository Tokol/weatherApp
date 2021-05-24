import 'dart:convert';

import 'package:http/http.dart' as http;

import 'end_points.dart';

class Network {
  String country;
  Network({this.country});

  Future<dynamic> getCoronaSummary({country}) async {
    String requestCountry;
    if (country != null) {
      requestCountry = country;
    } else {
      requestCountry = "Nepal";
    }

    try {
      http.Response response;

      response = await http.get(requestSummary(requestCountry));

      var result = json.decode(response.body);
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
