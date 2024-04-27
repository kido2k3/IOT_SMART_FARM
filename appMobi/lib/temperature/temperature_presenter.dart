

import 'dart:convert';

import 'package:app_mobi/model/adafruit_server.dart';
import 'package:app_mobi/mvp/presenter.dart';
import 'package:app_mobi/temperature/temperature_view.dart';

import '../model/network/http_help.dart';

TemperaturePresenter temperaturePresenter = TemperaturePresenter();

class TemperaturePresenter extends Presenter<TemperatureView>{
  void changeValue(double val){
    isViewAttached ? getView().updateData(val) : null;
  }
  Future<void> getValue() async {
    checkViewAttached();
    Future.delayed(const Duration(seconds: 5));
    String url = "https://io.adafruit.com/api/v2/kido2k3/feeds/iot-temperature";
    var response = await adafruitServer.httpHelper.fetchText(url);
    if (NetworkUtils.isReqSuccess(response)) {
      String text = response.body;
      final jsonData = await json.decode(text);
      final val = jsonData["last_value"];
      print(val);
      isViewAttached ? getView().updateData(double.parse(val)) : null;
    } else {
      isViewAttached ? getView().onFailLoadUpdate() : null;
    }
  }
}