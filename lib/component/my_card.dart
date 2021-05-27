import 'package:flutter/material.dart';
import 'package:flutter_app/const/const.dart';


class MyCard extends StatelessWidget {

  Widget child;
  MyCard({this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color:kContainerColor,

          borderRadius: BorderRadius.circular(20.0)),

      child: child,




    );
  }
}
