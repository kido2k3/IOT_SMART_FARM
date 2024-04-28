import 'package:app_mobi/home_screen_block/state_board/place_time/place_time_presenter.dart';
import 'package:app_mobi/home_screen_block/state_board/place_time/place_time_view.dart';
import 'package:flutter/material.dart';


class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> implements PlacetimeView{
  String _place = "Ho Chi Minh City";
  late PlacetimePresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_place',
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        height: 0,
        letterSpacing: -0.24,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _presenter = placetimePresenter;
    _presenter.attachView(this);
    // _presenter.getValue();
  }

  @override
  void updateData(String place) {
    setState(() {
      _place = place;
    });
  }

  @override
  void onFailUpdate() {
    setState(() {
      _place = "None";
    });
  }
}

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> implements PlacetimeView{
  String _time = "24.01.2024";
  late PlacetimePresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_time",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        height: 0,
        letterSpacing: -0.24,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _presenter = placetimePresenter;
    _presenter.attachView(this);
    _presenter.getValue();
  }

  @override
  void updateData(String time) {
    setState(() {
      _time = time;
    });
  }

  @override
  void onFailUpdate() {
    setState(() {
      _time = "None";
    });
  }
}






