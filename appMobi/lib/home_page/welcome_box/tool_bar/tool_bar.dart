import 'package:app_mobi/home_page/welcome_box/tool_bar/tool_bar_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/tool_bar/tool_bar_view.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/humidity/humidity.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({Key? key}) : super(key: key);

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> implements ToolBarView, WelcomeBoxView {
  late ToolBarPresenter _presenter;
  late WelcomeBoxPresenter _welcomeboxpresenter;

  @override
  void initState() {
    super.initState();
    _presenter = toolBarPresenter;
    _presenter.attachView(this);
    _welcomeboxpresenter = welcomeBoxPresenter;
    _welcomeboxpresenter.attachView(this);
  }

  @override
  void setStatus(bool status) {
    setState(() {
      _presenter.isConnected = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        // borderRadius: BorderRadius.only(
        //   topRight: Radius.circular(25),
        //   topLeft: Radius.circular(25),
        // ),
      ),
      margin: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 5,
      ),
      child: Row(
        children: [
          Expanded(
              child: Temperature(),
          ),
          Expanded(
            flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.15),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                ),
                margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: IconButton(
                  onPressed: _presenter.isConnected ? null : () {_presenter.serverOnPressed(context);},
                  icon: _presenter.isConnected ? Icon(Icons.sensors, size: 30, color: Colors.black) : Icon(Icons.sensors_off, size: 30, color: Colors.black),
                ),
              ),
          ),
          Expanded(
              child: Humidity(),
          ),
        ],
      ),
    );
  }

  @override
  void setCity(String city) {
    // TODO: implement setCity
  }

  @override
  void updateTime(String time) {
    // TODO: implement updateTime
  }

  // Widget _buildButton({VoidCallback? onPressed, required Icon icon}) {
  //   return Column(
  //     children: [
  //       IconButton(
  //         onPressed: onPressed,
  //         icon: icon,
  //       ),
  //       // Text(
  //       //   label,
  //       //   textAlign: TextAlign.center,
  //       //   style: MyTextStyle.weather,
  //       // ),
  //     ],
  //   );
  // }

}
