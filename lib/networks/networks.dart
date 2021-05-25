import 'dart:convert';

import 'package:flutter_app/models/covid_model.dart';
import 'package:http/http.dart' as http;

import 'end_points.dart';

class Network {
  String country;
  Network({this.country});

  Future<Covid> getCoronaSummary() async {
    if (country == null) {
      country = "Nepal";
    }

    try {
      http.Response response;

      response = await http.get(requestSummary(country), headers: {"x-rapidapi-key":"757d02bda2msh9c9ccec72b99b9dp11907djsn658419b200ca"});

      var result = json.decode(response.body);


       String totalActiveCase = result["data"]["Active Cases"];
       String totalPostiveCase = result["data"]["Total Cases"];
       String totalRecovered = result["data"]["Total Recovered"];
       String totalDeaths = result["data"]["Total Deaths"];
       String newPositiveCase = result["data"]["New Cases"];
       String newRecovered = result["data"]["New Recovered"];
       String newDeaths = result["data"]["New Deaths"];
       String updateTime = result["last_update"];


       Covid _covid = Covid(totalActiveCase: totalActiveCase,
           totalTestPostive: totalPostiveCase,
           totalRecovred: totalRecovered, totalDeaths: totalDeaths,
          newConfirmCase: newPositiveCase, newDeaths: newDeaths,
          newRecovered: newRecovered, country: country,
           updateTime:updateTime);

      return _covid;
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
