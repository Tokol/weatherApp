import 'package:flutter/material.dart';
import 'package:flutter_app/models/covid_model.dart';

import 'hospitals_list.dart';
import 'myth_list.dart';
import 'networks/networks.dart';


class CoronaScreen extends StatefulWidget {
  @override
  _CoronaScreenState createState() => _CoronaScreenState();
}

class _CoronaScreenState extends State<CoronaScreen> {

Network network;
Covid covidSummary;
bool isLoading=false;


  @override
  void initState() {
    requestCountry();
    super.initState();
  }

      requestCountry({String country}) async {
        setState(() {
          isLoading = true;
        });
        network = Network(country: country);
        covidSummary = await network.getCoronaSummary();

        setState(() {
          isLoading = false;
        });


      }



     List<DropdownMenuItem<String>> getDropDownItems(){

    List<DropdownMenuItem<String>> drodownitems = [];

            List<String> countries = ["Nepal","India", "Bhutan", "Pakistan"];

            for (int i=0; i<countries.length; i++){
              drodownitems.add(DropdownMenuItem(
                value:countries[i],
                  child: Text(countries[i]),
              ));

            }

            return drodownitems;


     }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Covid-19 status'),),

      body: isLoading || covidSummary==null?CircularProgressIndicator():
      Padding(
        padding: EdgeInsets.all(10.0),


          child: Card(

            elevation: 15.0,

            child: Column(




              children: [

                Text('Covid status of ${covidSummary.country}', style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600),),


                MyTile(
                  leading: '🔬',
                  title: 'Total Active Case',
                  trailing: covidSummary.totalActiveCase,

                ),

                MyTile(
                  leading: '🦠',
                  title: 'Total Test Positive',
                  trailing: covidSummary.totalTestPostive,
                ),

                MyTile(
                  leading: '💪',
                  title: 'Total Recovered Case',
                  trailing: covidSummary.totalRecovred,

                ),

                MyTile(
                  leading: '😭',
                  title: 'Total Deaths',
                  trailing: covidSummary.totalDeaths,

                ),


                MyTile(
                  leading: '😷',
                  title: 'New Confirm Case',
                  trailing: covidSummary.newConfirmCase,

                ),

                MyTile(
                  leading: '💪',
                  title: 'New Recovered Case',
                  trailing: covidSummary.newRecovered,

                ),

                MyTile(
                  leading: '😭',
                  title: 'New Deaths',
                  trailing: covidSummary.newDeaths,

                ),

                MyTile(
                  leading: '🕒',
                  title: '',
                  trailing: covidSummary.updateTime,

                ),



                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),

                  child: DropdownButton<String>(
                    isExpanded: true,

                    icon: const Icon(Icons.arrow_downward),

                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),

                      value: covidSummary.country,
                      onChanged: (value){
                        requestCountry(country: value);

                      },

                    items:getDropDownItems(),



                  ),
                ),



                Expanded(

                  child: Row(

                    children: [


                      Expanded(child: MyMenu(icon: Icons.fact_check, title: 'Corona Myths', onPress: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MythList()));




                      },)),
                      Expanded(child: MyMenu(icon: Icons.local_hospital, title: 'Hospitals', onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalList()));



                      },)),



                    ],

                  ),
                ),




              ],



            ),


          ),
        ),


    );
  }
}


class MyTile extends StatelessWidget {

  String title;
  String leading;
  String trailing;

  MyTile({this.title,this.leading,this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Text(this.leading, style: TextStyle(fontSize: 55.0), ),
        trailing: Text(this.trailing, style: TextStyle(fontSize: 22.0),),
        title: Text(this.title,style: TextStyle(fontSize: 22.0),),
      ),
    );
  }
}


class MyMenu extends StatelessWidget {

  IconData icon;
  String title;
  Function onPress;


  MyMenu({@required this.title, @required this.icon, this.onPress});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.all(10.0),

        child: Card(
          elevation: 10.0,

          child: Column(

            children: [

              Icon(this.icon, color: Colors.blue, size: 33.0,),

              Text(this.title, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),),




            ],
          ),


        ),
      ),
    );
  }
}
