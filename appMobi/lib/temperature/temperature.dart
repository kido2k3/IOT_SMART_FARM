import 'package:app_mobi/temperature/temperature_presenter.dart';
import 'package:app_mobi/temperature/temperature_view.dart';
import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> implements TemperatureView {
  double _value = 0;
  late TemperaturePresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$_value℃",
          style: const TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 30)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = temperaturePresenter;
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
