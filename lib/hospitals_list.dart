import 'package:flutter/material.dart';
import 'package:flutter_app/networks/networks.dart';
class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}


class _HospitalListState extends State<HospitalList> {
  Network _network;

  @override
  void initState() {
    getHospitalList();
    super.initState();
  }


  void getHospitalList() async {
    _network = Network();

    dynamic result = await _network.getHospitalList();
print(result);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hospital List'),),
    );
  }
}
