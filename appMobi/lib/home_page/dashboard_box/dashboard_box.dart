import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

import 'dashboard_box_presenter.dart';
import 'dashboard_box_view.dart';

class DashboardBox extends StatefulWidget {
  const DashboardBox({super.key});

  @override
  State<DashboardBox> createState() => _DashboardBoxState();
}

class _DashboardBoxState extends State<DashboardBox> implements DashboardBoxView {
  String _name = "";
  late DashboardBoxPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = DashboardBoxPresenter();
    _presenter.attachView(this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1),
      ),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding:const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: WeatherBox(),
          ),
        ],
      ),
    );
  }
}
