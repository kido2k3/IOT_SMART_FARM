
import 'dart:async';

import 'package:app_mobi/home_page/tool_bar/tool_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../model/adafruit_server.dart';
import '../../mvp/mvp_presenter.dart';

ToolBarPresenter toolBarPresenter = ToolBarPresenter();
class ToolBarPresenter extends MvpPresenter<ToolBarView>{
  TextEditingController _userController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _flow1Controller = TextEditingController();
  TextEditingController _flow2Controller = TextEditingController();
  TextEditingController _flow3Controller = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _cycleController = TextEditingController();
  TextEditingController _starttimeController = TextEditingController();
  TextEditingController _stoptimeController = TextEditingController();

  void getStatus(){
    checkViewAttached();
    bool status = adafruitServer.isConnected();
    isViewAttached ? getView().setStatus(status) : null;
  }

  void updateAreaController(String? area) {
    _areaController.text = area.toString();
  }

  void _updateStartTime(String newTime) {
      _starttimeController.text = newTime;
  }

  void _updateStopTime(String newTime) {
      _stoptimeController.text = newTime;
  }

  Future newtaskOnPressed(BuildContext context) async => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("New task"),
          content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: 400,
                  width: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Name of Project",
                            labelText: "Name of Project",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          controller: _nameController,
                        ),
                        Row(
                          children: [
                            Text('Select       '),
                            Text(
                              _areaController.text.toString().isEmpty ? "Select Area": _areaController.text.toString(),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              onSelected: (String? area) {
                                setState(() {
                                  _areaController.text = area.toString();
                                });
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Area 1',
                                  child: Text('Area 1'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Area 2',
                                  child: Text('Area 2'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Area 3',
                                  child: Text('Area 3'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Concentration of 1st Fertilizer",
                            labelText: "Concentration of 1st Fertilizer",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          controller: _flow1Controller,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Concentration of 2nd Fertilizer",
                            labelText: "Concentration of 2nd Fertilizer",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          controller: _flow2Controller,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Concentration of 3rd Fertilizer",
                            labelText: "Concentration of 3rd Fertilizer",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          controller: _flow3Controller,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Cycle",
                            labelText: "Cycle",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          controller: _cycleController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Start Time      "),
                            Container(
                              width: 50,
                                height: 50,
                                child: TextField(
                                  // textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration: const InputDecoration(
                                    hintText: "HH",
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                  controller: _starttimeController,
                                  onChanged: (value) {
                                    if (value.length == 2) {
                                      if (int.parse(value) < 60) {
                                        setState(() {
                                          _updateStartTime('$value:${_starttimeController.text.split(':')[1]}');
                                        });
                                      }
                                    }
                                    else if (value.length == 1) {
                                      setState(() {
                                        _updateStartTime('$value:${_starttimeController.text.split(':')[1]}');
                                      });
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                ),
                            ),
                            Text(':'),
                            Container(
                              width: 50,
                              height: 50,
                              child: TextField(
                                // textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                  hintText: "MM",
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                onChanged: (value) {
                                  if (value.length == 2) {
                                    if (int.parse(value) < 60) {
                                      setState(() {
                                        _updateStartTime('${_starttimeController.text.split(':')[0]}:$value');
                                      });
                                    }
                                  } else if (value.length == 1) {
                                      setState((){
                                        _updateStartTime('${_starttimeController.text.split(':')[0]}:$value');
                                      });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Stop Time     "),
                            Container(
                              width: 50,
                              height: 50,
                              child: TextField(
                                // textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                  hintText: "HH",
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                controller: _stoptimeController,
                                onChanged: (value) {
                                  if (value.length == 2) {
                                    if (int.parse(value) < 60) {
                                      setState(() {
                                        _updateStopTime('$value:${_stoptimeController.text.split(':')[1]}');
                                      });
                                    }
                                  }
                                  else if (value.length == 1) {
                                    setState(() {
                                      _updateStopTime('$value:${_stoptimeController.text.split(':')[1]}');
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                              ),
                            ),
                            Text(':'),
                            Container(
                              width: 50,
                              height: 50,
                              child: TextField(
                                // textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: const InputDecoration(
                                  hintText: "MM",
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                onChanged: (value) {
                                  if (value.length == 2) {
                                    if (int.parse(value) < 60) {
                                      setState(() {
                                        _updateStopTime('${_stoptimeController.text.split(':')[0]}:$value');
                                      });
                                    }
                                  } else if (value.length == 1) {
                                    setState(() {
                                      _updateStopTime('${_stoptimeController.text.split(':')[0]}:$value');
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        );
      });

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