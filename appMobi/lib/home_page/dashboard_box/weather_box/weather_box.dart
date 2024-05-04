import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class WeatherBox extends StatefulWidget {
  const WeatherBox({super.key});

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> implements WeatherView {
  String _city = "";
  String _time = "";
  double _temperature = 0;
  double _humidity = 0;
  late WeatherBoxPresenter  _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = WeatherBoxPresenter();
    _presenter.attachView(this);
    _presenter.getTime();
    _presenter.getCity();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8999999761581421), borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(_city,
                          style: MyTextStyle.weather
                      ),
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Text(_time,
                      style: MyTextStyle.weather
                      ),
                ],
              )),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Temperature", style: MyTextStyle.weather),
                      Text("$_temperature℃", style: MyTextStyle.weather)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Humidity", style: MyTextStyle.weather),
                      Text("$_humidity%", style: MyTextStyle.weather)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void setCity(String city) {
    // TODO: implement setCity
    setState(() {
      _city = city;
    });
  }

  @override
  void updateHumidity(double val) {
    // TODO: implement updateHumidity
    setState(() {
      _humidity = val;
    });
  }

  @override
  void updateTemperature(double val) {
    // TODO: implement updateTemperature
    setState(() {
      _temperature = val;
    });
  }

  @override
  void updateTime(String time) {
    // TODO: implement updateTime
    setState(() {
      _time = time;
    });
  }
}
