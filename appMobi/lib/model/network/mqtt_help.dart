import 'dart:io';
import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';



class MqttHelp {
  final String hostName;
  final String clientID;
  final String userName;
  final String password;
  var feeds;
  late MqttServerClient _client;
  MqttHelp({
    required this.hostName,
    required this.userName,
    required this.feeds,
    this.password = "",
    this.clientID = ""}) {
    _client = MqttServerClient(hostName, clientID);
    //_client.setProtocolV31();
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
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
  }

  void onConnected() {
    print('Client connection was successful');
  }

  /// Pong callback
  void pong() {
    print('Ping response client callback invoked');
  }
}
