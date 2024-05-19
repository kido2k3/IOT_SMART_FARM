import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:app_mobi/home_page/task_box/data_set_box/data_set_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/humidity/humidity_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/temperature/temperature_presenter.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


import '../../home_page/welcome_box/tool_bar/tool_bar_presenter.dart';



class MqttHelp {
  final String hostName;
  final String clientID;
  late String userName;
  late String password;
  var feeds;
  late MqttServerClient _client;

  DataSetBoxPresenter _datasetboxpresenter = dataSetBoxPresenter;
  TemperaturePresenter _temperaturepresenter = temperaturePresenter;
  HumidityPresenter _humiditypresenter = humidityPresenter;

  MqttHelp({
    required this.hostName,
    required this.userName,
    this.feeds,
    this.password = "",
    this.clientID = ""}) {
    _client = MqttServerClient(hostName, clientID);
    _client.setProtocolV311();
    _client.pongCallback = pong;
    _client.onConnected = onConnected;
    _client.onSubscribed = onSubscribed;
    _client.onDisconnected = onDisconnected;

    _client.logging(on: false);
    _client.keepAlivePeriod = 60;
    final connMess = MqttConnectMessage()
        .withClientIdentifier(clientID)
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    _client.connectionMessage = connMess;
  }
  void publish(String pubTopic, String msg){
    final builder = MqttClientPayloadBuilder();
    builder.addString(msg);
    print("publish");
    _client.publishMessage(pubTopic, MqttQos.atMostOnce, builder.payload!,
        retain: true);
  }

  bool isConnected(){
    return _client.connectionStatus!.state == MqttConnectionState.connected;
  }

  Future<void> connect() async {
    try {
      await _client.connect(userName, password);
      if (_client.connectionStatus!.state == MqttConnectionState.connected) {
        print('EXAMPLE:: client connected');
      } else {
        print(
            'EXAMPLE::ERROR client connection failed - disconnecting, state is ${_client.connectionStatus!.state}');
        _client.disconnect();
        exit(-1);
      }
      _client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        print('Received message: topic is ${c[0].topic}, payload is $pt');
        if (c[0].topic == "kido2k3/feeds/iot-temperature") {
          _temperaturepresenter.getValue();
        }
        else if (c[0].topic == "kido2k3/feeds/iot-humidity") {
          _humiditypresenter.getValue();
        }
        else if (c[0].topic == "kido2k3/feeds/iot-gateway") {
          _datasetboxpresenter.getValue();
        }
      });
      for (var element in feeds) {
        _client.subscribe(element, MqttQos.atMostOnce);
      }
    } on Exception catch (e) {
      print('client exception - $e');
      _client.disconnect();
    }
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('Client disconnection');
    print(_client.connectionStatus!.state == MqttConnectionState.connected);
    toolBarPresenter.getStatus();
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
    if (topic == "kido2k3/feeds/iot-temperature") {
      _temperaturepresenter.getValue();
    }
    else if (topic == "kido2k3/feeds/iot-humidity") {
      _humiditypresenter.getValue();
    }
    else if (topic == "kido2k3/feeds/iot-gateway") {
      _datasetboxpresenter.getValue();
    }
  }

  void onConnected() {
    print('Client connection was successful');
    toolBarPresenter.getStatus();
  }

  /// Pong callback
  void pong() {
    print('Ping response client callback invoked');
  }
}
