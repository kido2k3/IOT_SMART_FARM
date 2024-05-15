
import 'package:app_mobi/home_page/welcome_box/weather_box/humidity/humidity.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class WeatherBox extends StatefulWidget {
  const WeatherBox({super.key});

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> implements WeatherBoxView {

  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
