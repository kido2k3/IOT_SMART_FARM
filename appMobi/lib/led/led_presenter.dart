


import 'dart:convert';

import 'package:app_mobi/mvp/presenter.dart';

import '../model/adafruit_server.dart';
import '../model/network/http_help.dart';
import 'led_view.dart';

LedPresenter ledPresenter = LedPresenter();
class LedPresenter extends Presenter<LedView>{
  void changeValue(String val){
    if(val == "1"){
      isViewAttached ? getView().updateBool(true) : null;
    }
    else{
      isViewAttached ? getView().updateBool(false) : null;
    }
  }
  void publish(bool val){
    if(val == true){
      adafruitServer.mqttHelp.publish("kido2k3/feeds/iot-led", "1");
    }
    else{
      adafruitServer.mqttHelp.publish("kido2k3/feeds/iot-led", "0");
    }
  }
  Future<void> getValue() async {
    checkViewAttached();
    Future.delayed(const Duration(seconds: 5));
    String url = "https://io.adafruit.com/api/v2/kido2k3/feeds/iot-led";
    var response = await adafruitServer.httpHelper.fetchText(url);
    if (NetworkUtils.isReqSuccess(response)) {
      String text = response.body;
      final jsonData = await json.decode(text);
      final val = jsonData["last_value"];
      print(val);
      if(val == "1"){
        isViewAttached ? getView().updateBool(true) : null;
      }
      else{
        isViewAttached ? getView().updateBool(false) : null;
      }
    } else {
      isViewAttached ? getView().onFailLoadUpdate() : null;
    }
  }
}