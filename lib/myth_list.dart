import 'package:flutter/material.dart';
import 'package:flutter_app/models/myths_model.dart';

import 'networks/networks.dart';
class MythList extends StatefulWidget {
  @override
  _MythListState createState() => _MythListState();
}

class _MythListState extends State<MythList> {
Network _network;
List<CovidMyths> _covidMyths = [];
bool loading = false;

  @override
  void initState() {
    loadMythsCovid();
    super.initState();
  }


  void loadMythsCovid() async {
    setState(() {
      loading = true;
    });
    _network = Network();
    _covidMyths = await _network.getmyths();

    setState(() {
      loading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Myths about covid'),),

      body: loading?Center(
          child: CircularProgressIndicator()):ListView.builder(

        itemCount:_covidMyths.length,
        itemBuilder: (context, position){

           return Padding(
             padding: EdgeInsets.all(20.0),

             child: Card(
               elevation: 10.0,
               child: Column(

                children: [

                  SizedBox(height: 10,),

                  Text('Myths ${position+1}',style: TextStyle(fontSize: 32.0),),

                  SizedBox(height: 10,),
                  Text('Myth English: ${_covidMyths[position].mythEnglish}', style: TextStyle(fontSize: 22.0),),
                  SizedBox(height: 20,),


                  Text('Myth Nepali: ${_covidMyths[position].mythNep}',style: TextStyle(fontSize: 22.0),),
                  SizedBox(height: 20,),

                  Text('Reality English: ${_covidMyths[position].realityEnglish}',style: TextStyle(fontSize: 26.0),),
                  SizedBox(height: 20,),
                  Text('Reality Nepali: ${_covidMyths[position].realityNep}',style: TextStyle(fontSize: 26.0),),
                  SizedBox(height: 20,),

                  _covidMyths[position].newtworkImage !=null?
                  Image(
                    height: 400,
                    width: MediaQuery.of(context).size.width-10,
                    image: NetworkImage(_covidMyths[position].newtworkImage),
                  ): SizedBox(height: 10,)


                ],

               ),
             ),
           );


        },





      ),


    );
  }
}
