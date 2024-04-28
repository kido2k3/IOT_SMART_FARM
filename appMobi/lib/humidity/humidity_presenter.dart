import 'dart:convert';

import 'package:app_mobi/humidity/humidity_view.dart';

import '../model/adafruit_server.dart';
import '../model/network/http_help.dart';
import '../mvp/mvp_presenter.dart';

HumidityPresenter humidityPresenter = HumidityPresenter();

class HumidityPresenter extends MvpPresenter<HumidityView>{
  void changeValue(double val){
    checkViewAttached();
    isViewAttached ? getView().updateData(val) : null;
  }
  Future<void> getValue() async {
    checkViewAttached();
    Future.delayed(const Duration(seconds: 5));
    String url = "https://io.adafruit.com/api/v2/kido2k3/feeds/iot-humidity";
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