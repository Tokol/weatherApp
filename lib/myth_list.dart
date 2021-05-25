import 'package:flutter/material.dart';
class MythList extends StatefulWidget {
  @override
  _MythListState createState() => _MythListState();
}

class _MythListState extends State<MythList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Myths about covid'),),
    );
  }
}
