

import 'package:flutter/material.dart';

import 'humidity_presenter.dart';
import 'humidity_view.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> implements HumidityView {
  double _value = 0;
  late HumidityPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$_value%",
          style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 30),
          textAlign: TextAlign.center
      ),

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = humidityPresenter;
    _presenter.attachView(this);
    _presenter.getValue();
  }

  @override
  void updateData(double value) {
    // TODO: implement updateData
    setState(() {
      _value = value;
    });
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      _value = -99;
    });
  }
}