import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class WelcomeBox extends StatefulWidget {
  const WelcomeBox({super.key});

  @override
  State<WelcomeBox> createState() => _WelcomeBoxState();
}

class _WelcomeBoxState extends State<WelcomeBox> implements WelcomeBoxView {
  String _name = "";
  late WelcomeBoxPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = WelcomeBoxPresenter();
    _presenter.attachView(this);
    _presenter.getName();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30)),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding:const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
                "Welcome $_name",
                style: MyTextStyle.welcome,
                textAlign: TextAlign.left,
            )
          ),
          const Expanded(
              flex: 3,
              child: WeatherBox()
          )
        ],
      ),
    );
  }

  @override
  void setName(String name) {
    // TODO: implement setName
    setState(() {
      _name = name;
    });
  }
}
