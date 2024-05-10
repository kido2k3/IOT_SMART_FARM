import 'package:app_mobi/model/network/mqtt_help.dart';

import 'network/http_help.dart';

AdafruitServer adafruitServer = AdafruitServer();


class AdafruitServer {
  static final AdafruitServer _adafruitServer = AdafruitServer._internal();
  final HttpHelper httpHelper = HttpHelper();
  final MqttHelp mqttHelp = MqttHelp(
      hostName: "io.adafruit.com",
      userName: "kido2k3",
      password: "password",
      feeds: [
        "kido2k3/feeds/iot-humidity",
        "kido2k3/feeds/iot-temperature",
        "kido2k3/feeds/iot-gateway",
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