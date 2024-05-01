
import 'dart:async';
import 'dart:math';

import 'package:app_mobi/home_page/task_box/task_box.dart';
import 'package:app_mobi/home_page/task_box/task_box_presenter.dart';
import 'package:app_mobi/home_page/tool_bar/tool_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../model/adafruit_server.dart';
import '../../mvp/mvp_presenter.dart';

ToolBarPresenter toolBarPresenter = ToolBarPresenter();

class ToolBarPresenter extends MvpPresenter<ToolBarView> {
  List<Map<String, dynamic>> DataSet = [];

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

  TimeOfDay starttime = TimeOfDay.now();
  TimeOfDay stoptime = TimeOfDay.now();

  void getStatus(){
    checkViewAttached();
    bool status = adafruitServer.isConnected();
    isViewAttached ? getView().setStatus(status) : null;
  }

  void updateAreaController(String? area) {
    _areaController.text = area.toString();
  }

  void updateStartTimeController (String s) {
    _starttimeController.text = s;
  }

  void updateStopTimeController (String s) {
    _stoptimeController.text = s;
  }

   void AddADataSet (Map<String, dynamic> newDataSet) {
      DataSet.add(newDataSet);
  }
  void ClearAllDataSet () {
      DataSet.clear();
  }

  Future newtaskOnPressed(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white.withOpacity(0.8999999761581421),
          title: Row(
            children: [
              Text("New task",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(width: 400 - 100 * 3.5),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent.withOpacity(0.7),
                  border: Border.all(color: Colors.black),
                ),
                child: TextButton(
                  onPressed: () {CreateNewTask(context);},
                  child: const Text("Create", style: TextStyle(color: Colors.black, fontSize: 20)),),
              ),
            ],
          ),
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
                            labelText: "Name of New Task",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _nameController,
                        ),
                        Row(
                          children: [
                            Text(
                              'Select       ', style: TextStyle(fontSize: 20),),
                            Text(
                              _areaController.text
                                  .toString()
                                  .isEmpty ? "Select Area" : _areaController
                                  .text.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              onSelected: (String? area) {
                                setState(() {
                                  _areaController.text = area.toString();
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Area 1',
                                  child: Text('Area 1',
                                      style: TextStyle(fontSize: 20)),),
                                PopupMenuItem<String>(
                                  value: 'Area 2',
                                  child: Text(
                                      'Area 2', style: TextStyle(fontSize: 20)),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Area 3',
                                  child: Text(
                                      'Area 3', style: TextStyle(fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Concentration of 1st Fertilizer",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _flow1Controller,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Concentration of 2nd Fertilizer",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _flow2Controller,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Concentration of 3rd Fertilizer",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          controller: _flow3Controller,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Cycle",
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 20),
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
                            Text(
                                'Start Time  ${starttime.hour}:${starttime
                                    .minute}  ',
                                style: TextStyle(fontSize: 20)),
                            SizedBox(width: 10),
                            Container(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final TimeOfDay? pickedTime = await showCustomTimePicker(
                                    context: context,
                                    initialTime: starttime, // Thời gian ban đầu
                                  );
                                  if (pickedTime != null) {
                                    setState(() {
                                      starttime = pickedTime;
                                      updateStartTimeController(
                                          '${starttime.hour
                                              .toString()}:${starttime.minute
                                              .toString()}');
                                    });
                                  }
                                },
                                child: Text("Choose",
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                                'Stop Time  ${stoptime.hour}:${stoptime
                                    .minute}  ',
                                style: TextStyle(fontSize: 20)),
                            SizedBox(width: 10),
                            Container(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final TimeOfDay? pickedTime = await showCustomTimePicker(
                                    context: context,
                                    initialTime: stoptime, // Thời gian ban đầu
                                  );
                                  if (pickedTime != null) {
                                    setState(() {
                                      stoptime = pickedTime;
                                      updateStopTimeController('${stoptime.hour
                                          .toString()}:${stoptime.minute
                                          .toString()}');
                                    });
                                  }
                                },
                                child: Text("Choose",
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              }
          ),
        );
      },
    );
  }
  Future serverOnPressed(BuildContext context) async => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text("Adafruit information"),
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
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.greenAccent.withOpacity(0.7),
              ),
              child:  TextButton(onPressed: () {reconnect(context);},
                  child: const Text("Reconnect", style: TextStyle(color: Colors.black))
              ),
            ),
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

  Future CreateNewTask(BuildContext context) async {
    if (_nameController.text.isEmpty || _areaController.text.isEmpty ||
        _flow1Controller.text.isEmpty || _flow2Controller.text.isEmpty ||
        _flow3Controller.text.isEmpty ||
        _cycleController.text.isEmpty || _starttimeController.text.isEmpty ||
        _stoptimeController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(Icons.error_outlined, size: 30, color: Colors.red,),
                SizedBox(width: 20),
                Text("ERROR", textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),),
              ],
            ),
            content: Text(
              "Please fill in all fields!", style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),),
              ),
            ],
          );
        },
      );
    }
    else {
      Map<String, dynamic> newDataSet = {
        'Name': '${_nameController.text.toString()}',
        'Area': '${_areaController.text.toString()}',
        'Concentration of 1st fertilizer': '${_flow1Controller.text
            .toString()}',
        'Concentration of 2nd fertilizer': '${_flow2Controller.text
            .toString()}',
        'Concentration of 3rd fertilizer': '${_flow3Controller.text
            .toString()}',
        'Cycle': '${_cycleController.text.toString()}',
        'Start Time': '${_starttimeController.text.toString()}',
        'Stop Time': '${_stoptimeController.text.toString()}',
      };
        AddADataSet(newDataSet);
      if (DataSet.length >= 3) {
        ClearAllDataSet();
      }
      Navigator.pop(context);
      _nameController.text = "";
      _areaController.text = "";
      _flow1Controller.text = "";
      _flow2Controller.text = "";
      _flow3Controller.text = "";
      _cycleController.text = "";
      _starttimeController.text = "";
      _stoptimeController.text = "";
      starttime = TimeOfDay(hour: 0, minute: 0);
      stoptime = TimeOfDay(hour: 0, minute: 0);
    }
  }

  Future<TimeOfDay?> showCustomTimePicker({
    required BuildContext context,
    required TimeOfDay initialTime,
  })
  async {
    TimeOfDay? selectedTime = initialTime;

     await showModalBottomSheet<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 300,
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text("Select Time", style: TextStyle(fontSize: 25, color: Colors.black),),
                          SizedBox(width: 400 - 100*2.5),
                          TextButton(
                              onPressed: () {Navigator.pop(context);},
                              child: Text("Done", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hm,
                        initialTimerDuration: Duration(
                          hours: initialTime.hour,
                          minutes: initialTime.minute,
                        ),
                        onTimerDurationChanged: (Duration changedTime) {
                          setState(() {
                            selectedTime = TimeOfDay(
                              hour: changedTime.inHours,
                              minute: changedTime.inMinutes.remainder(60),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
     return selectedTime;
  }
}