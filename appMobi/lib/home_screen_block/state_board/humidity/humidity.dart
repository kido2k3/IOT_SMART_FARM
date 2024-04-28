import 'package:app_mobi/home_screen_block/state_board/humidity/humidity_presenter.dart';
import 'package:app_mobi/home_screen_block/state_board/humidity/humidity_view.dart';
import 'package:flutter/material.dart';

class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityState();
}

class _HumidityState extends State<Humidity> implements HumidityView{
  double _value = 0;
  late HumidityPresenter _presenter;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$_value %",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        height: 0,
        letterSpacing: -0.24,
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



