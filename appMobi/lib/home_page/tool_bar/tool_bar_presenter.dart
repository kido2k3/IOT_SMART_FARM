
import 'package:app_mobi/home_page/tool_bar/tool_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/adafruit_server.dart';
import '../../mvp/mvp_presenter.dart';

ToolBarPresenter toolBarPresenter = ToolBarPresenter();
class ToolBarPresenter extends MvpPresenter<ToolBarView>{
  TextEditingController _userController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  void getStatus(){
    checkViewAttached();
    bool status = adafruitServer.isConnected();
    isViewAttached ? getView().setStatus(status) : null;
  }
  Future serverOnPressed(BuildContext context) async => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Adafruit information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "User"),
                controller: _userController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Key"),
                controller: _keyController,
              )
            ],
          ),
          actions: [
            TextButton(onPressed: () {reconnect(context);},
                child: const Text("Reconnect"))
          ],
        );
      });
  Future reconnect(BuildContext context)async {
    adafruitServer.mqttHelp.userName = _userController.text;
    adafruitServer.mqttHelp.password = _keyController.text;
    adafruitServer.mqttHelp.connect();
    Navigator.of(context).pop();
    _userController.clear();
    _keyController.clear();
  }
}