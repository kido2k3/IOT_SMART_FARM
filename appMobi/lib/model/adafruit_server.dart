import 'package:app_mobi/model/network/mqtt_help.dart';

import 'network/http_help.dart';

AdafruitServer adafruitServer = AdafruitServer();


class AdafruitServer {
  static final AdafruitServer _adafruitServer = AdafruitServer._internal();
  final HttpHelper httpHelper = HttpHelper();
  final MqttHelp mqttHelp = MqttHelp(
      hostName: "io.adafruit.com",
      userName: "kido2k3",
      password: "insert here",
      feeds: [
      ]);

  // SharedPrefsHelper sharedPrefsHelper=new SharedPrefsHelper();

  factory AdafruitServer() {
    return _adafruitServer;
  }
  bool isConnected(){
    return mqttHelp.isConnected();
  }
  AdafruitServer._internal();
}