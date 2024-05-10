import 'package:app_mobi/home_page/welcome_box/weather_box/humidity/humidity.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box_view.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeBox extends StatefulWidget {
  const WelcomeBox({super.key});

  @override
  State<WelcomeBox> createState() => _WelcomeBoxState();
}

class _WelcomeBoxState extends State<WelcomeBox> implements WelcomeBoxView {
  String _name = "";
  late WelcomeBoxPresenter _welcomeboxpresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _welcomeboxpresenter = WelcomeBoxPresenter();
    _welcomeboxpresenter.attachView(this);
    _welcomeboxpresenter.getTime();
    _welcomeboxpresenter.getCity();
  }

  @override
  void setCity(String city) {
    setState(() {
      _welcomeboxpresenter.city = city;
    });
  }

  @override
  void updateTime(String time) {
    setState(() {
      _welcomeboxpresenter.time = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0),
          borderRadius: BorderRadius.circular(30)),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      // padding:const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0),
            borderRadius: BorderRadius.circular(15),
        ),
        // margin:const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        // padding:const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.transparent.withOpacity(0),
                  ),
                  child: Text(_welcomeboxpresenter.city,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ),
            Expanded(
              flex: 2,
              child: Temperature(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent.withOpacity(0),
                ),
                // padding:const EdgeInsets.all(10),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Humidity(),
                    Text(_welcomeboxpresenter.time,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
