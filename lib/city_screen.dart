import 'package:flutter/material.dart';
import 'package:flutter_app/weather_app.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffF4B893),


        appBar: AppBar(title: Text('Enter City', ), backgroundColor: Colors.amber,),

          body: Center(

            child:loading?Text('Loading'):Padding(
              padding: EdgeInsets.all(20.0),

              child: TextField(

                onChanged: (value){

                  cityName = value;

                },

                decoration: InputDecoration(
                    labelText: 'Enter City Name',

                    fillColor: Colors.white,
                    filled: true,

                    labelStyle: TextStyle(color: Colors.amber, fontSize: 22.0),
                    focusColor: Colors.black,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),

                    suffixIcon: IconButton(icon:Icon(Icons.send), onPressed:() async {

                    setState(() {
                      loading = true;
                    });

                      WeatherApp _weatherApp = WeatherApp();

                      var result = await _weatherApp.requestWeatherByCityName(cityName);

                    setState(() {
                      loading = false;
                    });

                      if(result!=null){
                        Navigator.pushReplacementNamed(context, 'home',);

                      }

                      else{
                        print('error');
                      }




                    })

                ),


              ),
            ),

          ),



    );
  }
}
