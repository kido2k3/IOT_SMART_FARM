import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature_view.dart';
import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> implements TemperatureView {
  late TemperaturePresenter _presenter;
  double temp = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = temperaturePresenter;
    _presenter.attachView(this);
    // _presenter.getValue();
  }

  @override
  void updateTemperatureData(double value) {
    // TODO: implement updateData
    setState(() {
      temp = value;
    });
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      temp = -99;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        // width: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.transparent.withOpacity(0.45),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.device_thermostat_outlined, size: 40, color: Colors.white,),
            Text("$temp℃", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }


  @override
  void updateData(double value) {
    // TODO: implement updateData
  }
}
