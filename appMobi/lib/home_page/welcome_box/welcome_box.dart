import 'package:app_mobi/home_page/welcome_box/tool_bar/tool_bar.dart';
import 'package:app_mobi/home_page/welcome_box/tool_bar/tool_bar_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/tool_bar/tool_bar_view.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/humidity/humidity.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature.dart';
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
        color: Colors.white.withOpacity(0.65),
        // border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(30),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(30),
        //   bottomLeft: Radius.circular(30),
        // ),
      ),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      // margin: const EdgeInsets.only(
      //   left: 20,
      //   top: 5,
      //   bottom: 5,
      // ),
      // padding:const EdgeInsets.all(5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent.withOpacity(0),
              ),
              margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                'Welcome Nghiem',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.transparent.withOpacity(0.75),
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.lightGreen.shade500.withOpacity(0.5),
                // border: Border.all(width: 0.5),
              ),
              margin:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              // padding:const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_welcomeboxpresenter.city,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_welcomeboxpresenter.time,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
