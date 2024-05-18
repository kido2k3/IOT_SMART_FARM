

import 'package:flutter/material.dart';

import 'humidity_presenter.dart';
import 'humidity_view.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> implements HumidityView {
  double humid = 0;
  late HumidityPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = humidityPresenter;
    _presenter.attachView(this);
    // _presenter.getValue();
  }

  @override
  void updateHumidityData(double value) {
    // TODO: implement updateData
    setState(() {
      humid = value;
    });
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      humid = -99.99;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent.withOpacity(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.water_drop_outlined, size: 25, color: Colors.black,),
          // SizedBox(width: 15),
          Text("$humid%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          )
        ],
      ),
    );
  }

  @override
  void updateData(double value) {
    // TODO: implement updateData
  }
}