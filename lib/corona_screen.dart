import 'package:flutter/material.dart';

import 'networks/networks.dart';


class CoronaScreen extends StatefulWidget {
  @override
  _CoronaScreenState createState() => _CoronaScreenState();
}

class _CoronaScreenState extends State<CoronaScreen> {

Network network;

  @override
  void initState() {
    requestCountry();
    super.initState();
  }

      requestCountry({String country}) async {

        network = Network(country: country);

          dynamic summary = await network.getCoronaSummary();

            print(summary);

      }




  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
