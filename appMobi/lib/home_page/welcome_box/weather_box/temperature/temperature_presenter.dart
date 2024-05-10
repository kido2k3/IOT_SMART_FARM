import 'dart:convert';

import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature_view.dart';
import 'package:app_mobi/model/adafruit_server.dart';
import 'package:app_mobi/model/network/http_help.dart';
import 'package:app_mobi/mvp/mvp_presenter.dart';

TemperaturePresenter temperaturePresenter = TemperaturePresenter();

class TemperaturePresenter extends MvpPresenter<TemperatureView>{

  // void changeValue(double val){
  //   isViewAttached ? getView().updateData(val) : null;
  // }
  Future<void> getValue() async {
    checkViewAttached();
    Future.delayed(const Duration(seconds: 5));
    String url = "https://io.adafruit.com/api/v2/kido2k3/feeds/iot-temperature";
    var response = await adafruitServer.httpHelper.fetchText(url);
    if (NetworkUtils.isReqSuccess(response)) {
      String text = response.body;
      final jsonData = await jsonDecode(text);
      final val = jsonData["last_value"];
      isViewAttached ? getView().updateTemperatureData(double.parse(val)): null;
    }
    else {
      isViewAttached ? getView().onFailLoadUpdate() : null;
    }
  }

}