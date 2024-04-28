import 'package:app_mobi/home_screen_block/state_board/wind/wind_presenter.dart';
import 'package:app_mobi/home_screen_block/state_board/wind/wind_view.dart';
import 'package:flutter/material.dart';

class Wind extends StatefulWidget {
  const Wind({super.key});

  @override
  State<Wind> createState() => _WindState();
}

class _WindState extends State<Wind> implements WindView{
  double _value = 0;
  late WindPresenter _presenter;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$_value km/h",
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
    _presenter = windPresenter;
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



