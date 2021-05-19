import 'package:flutter/material.dart';
import 'package:flutter_app/models/Weather.dart';
import 'package:flutter_app/weather_app.dart';

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {




  gotoCity(){
    Navigator.pushNamed(context, 'city');


  }



  @override
  Widget build(BuildContext context) {
    WeatherApp _weatherApp = WeatherApp();
    final weather = _weatherApp.weather;

    if(weather!=null){
        return Scaffold(
        backgroundColor: Color(0xffF4B893),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      weather.condition,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        IconButton(
                            color: Colors.white,
                            iconSize: 36.0,
                            icon: Icon(Icons.map),
                            onPressed: () {
                              gotoCity();
                            }),
                        IconButton(
                            color: Colors.white,
                            iconSize: 36.0,
                            icon: Icon(Icons.star_border),
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
                Expanded(

                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),

                    child: Image(
                      image: NetworkImage('https://cdn1.iconfinder.com/data/icons/weather-elements/512/Weather_SunAbstract.png'),
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.symmetric(vertical:20.0),
                  child: Column(


                    children: [

                      Row(children: [

                        IconButton(
                            color: Colors.white,
                            iconSize: 42.0,
                            icon: Icon(Icons.location_on,),
                            onPressed: () {

                              gotoCity();

                            }),

                        Text('${weather.location}', style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),)


                      ],),



                      Padding(
                        padding: EdgeInsets.only(left: 52.0),
                        child: Row(children: [

                          Text('${weather.temp}°C',style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold), ),


                          Expanded(

                            child: Padding(

                              padding: EdgeInsets.all(10.0),

                              child: Container(

                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      SizedBox(height: 5.0,),
                                      Text('wind', style:TextStyle(fontWeight: FontWeight.w400),),
                                      SizedBox(height: 5.0,),

                                      Text('${weather.wind} kmh',style:TextStyle(fontSize:22.0, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 5.0,),




                                    ],


                                  )


                              ),
                            ),
                          ),


                          Expanded(

                            child: Padding(

                              padding: EdgeInsets.all(10.0),

                              child: Container(

                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      SizedBox(height: 5.0,),
                                      Text('Humidity', style:TextStyle(fontWeight: FontWeight.w400),),
                                      SizedBox(height: 5.0,),

                                      Text('${weather.humid}%',style:TextStyle(fontSize:22.0, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 5.0,),




                                    ],


                                  )


                              ),
                            ),
                          ),


                        ],),
                      )





                    ],),
                ),






              ],
            ),
          ),
        ),
      );
    }

    else{
      return Text('Something went Wrong');
    }


  }
}
