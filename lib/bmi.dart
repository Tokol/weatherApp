import 'package:flutter/material.dart';
import 'package:flutter_app/const/const.dart';

import 'component/my_card.dart';

class BMIAPP extends StatefulWidget {
  @override
  _BMIAPPState createState() => _BMIAPPState();
}

class _BMIAPPState extends State<BMIAPP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),),

      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
         Expanded(child: Row(
           children: [

             Expanded(child: MyCard()),
             Expanded(child: MyCard()),

           ],


         )),

    Expanded(child:MyCard(),

    ),

          Expanded(child: Row(

            children: [
              Expanded(child: MyCard()),
              Expanded(child: MyCard()),



            ],


          ),

          ),




        ],
      ),



    );
  }
}
