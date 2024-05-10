import 'dart:convert';

import 'package:app_mobi/home_page/task_box/data_set_box/data_set_box_presenter.dart';
import 'package:app_mobi/home_page/task_box/data_set_box/data_set_box_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_mobi/my_share/user.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../model/adafruit_server.dart';
import '../../tool_bar/tool_bar_presenter.dart';
import '../../tool_bar/tool_bar_view.dart';
import 'package:flutter_sound/flutter_sound.dart';
import '../task_box_view.dart';

class DataSetBox extends StatefulWidget {
  const DataSetBox({Key? key}) : super(key: key);

  @override
  State<DataSetBox> createState() => _DataSetBoxState();
}

class _DataSetBoxState extends State<DataSetBox> implements DataSetBoxView, TaskBoxView, ToolBarView {
  late ToolBarPresenter _toolbarpresenter;
  late DataSetBoxPresenter _datasetboxpresenter;


  @override
  void initState() {
    super.initState();
    _toolbarpresenter = toolBarPresenter;
    _toolbarpresenter.attachView(this);
    _datasetboxpresenter = dataSetBoxPresenter;
    _datasetboxpresenter.attachView(this);
  }

  @override
  void addWaitingData() {
    setState(() {
      _toolbarpresenter.WaitingDataSet.add(_toolbarpresenter.userMap);
    });
  }

  @override
  void w2r(String id) {
    setState(() {
      Map<String, dynamic> foundUserMap = _toolbarpresenter.WaitingDataSet.firstWhere((map) => map["id"] == id, orElse: () => {});
      if (foundUserMap.isNotEmpty) {
        if (foundUserMap["remaining cycle"] == 0) {
          foundUserMap["remaining cycle"] = foundUserMap["cycle"];
        }
        _toolbarpresenter.WaitingDataSet.remove(foundUserMap);
        _toolbarpresenter.RunningDataSet.add(foundUserMap);
      }
    });
  }

  @override
  void r2w(String id) {
    setState(() {
      Map<String, dynamic> foundUserMap = _toolbarpresenter.RunningDataSet.firstWhere((map) => map["id"] == id, orElse: () => {});
      if (foundUserMap.isNotEmpty) {
        if (foundUserMap["remaining cycle"] == 1) {
          foundUserMap["remaining cycle"] = 0;
        }
        _toolbarpresenter.RunningDataSet.remove(foundUserMap);
        _toolbarpresenter.WaitingDataSet.add(foundUserMap);
      }
    });
  }

  @override
  void update(String id, int cycle) {
    setState(() {
      Map<String, dynamic> foundUserMap = _toolbarpresenter.RunningDataSet.firstWhere((map) => map["id"] == id, orElse: () => {});
      if (foundUserMap.isNotEmpty) {
        _toolbarpresenter.RunningDataSet.remove(foundUserMap);
        foundUserMap["remaining cycle"] = cycle;
        if (foundUserMap["remaining cycle"] != 0) {
          _toolbarpresenter.RunningDataSet.add(foundUserMap);
        }
        else {
          _toolbarpresenter.WaitingDataSet.add(foundUserMap);
        }
      }
    });
  }

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: Colors.white.withOpacity(0.25)),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Running",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _toolbarpresenter.RunningDataSet.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.8999999761581421),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                _datasetboxpresenter.detailrunningtaskOnPressed(context, index, _toolbarpresenter);
                                              },
                                              child: Text(
                                                '\t Name: ${_toolbarpresenter.RunningDataSet[index]['name']} \n'
                                                    '\t Start Time: ${_toolbarpresenter.RunningDataSet[index]['start time']} \n'
                                                    '\t Remaining Cycle: ${_toolbarpresenter.RunningDataSet[index]['remaining cycle']} \n',
                                                style: TextStyle(fontSize: 15, color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {

                                                  Map<String, dynamic> deleteUser = {
                                                    'code': 'delete',
                                                    'id': '${_toolbarpresenter.RunningDataSet[index]["id"]}'
                                                  };

                                                  String jsonString = JsonEncoder.withIndent(' ').convert(deleteUser);
                                                  adafruitServer.mqttHelp.publish('kido2k3/feeds/iot-mobile', jsonString);

                                                  _toolbarpresenter.RunningDataSet.removeAt(index);
                                                  if (_toolbarpresenter.RunningDataSet.length == 0) {
                                                    _toolbarpresenter.id = 1;
                                                  }
                                                });
                                              },
                                              icon: Icon(Icons.cancel_outlined),
                                              color: Colors.red,
                                              iconSize: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: Colors.white.withOpacity(0.25)),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Waiting",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _toolbarpresenter.WaitingDataSet.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(0.8999999761581421),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                _datasetboxpresenter.detailwaitingtaskOnPressed(context, index, _toolbarpresenter);
                                              },
                                              child: Text(
                                                '\t Name: ${_toolbarpresenter.WaitingDataSet[index]['name']} \n'
                                                    '\t Start Time: ${_toolbarpresenter.WaitingDataSet[index]['start time']} \n'
                                                    '\t Remaining Cycle: ${_toolbarpresenter.WaitingDataSet[index]['remaining cycle']} \n',
                                                style: TextStyle(fontSize: 15, color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {

                                                  Map<String, dynamic> deleteUser = {
                                                    'code': 'delete',
                                                    'id': '${_toolbarpresenter.WaitingDataSet[index]["id"]}'
                                                  };

                                                  String jsonString = JsonEncoder.withIndent(' ').convert(deleteUser);
                                                  adafruitServer.mqttHelp.publish('kido2k3/feeds/iot-mobile', jsonString);

                                                  _toolbarpresenter.WaitingDataSet.removeAt(index);
                                                  if (_toolbarpresenter.WaitingDataSet.length == 0) {
                                                    _toolbarpresenter.id = 1;
                                                  }
                                                });
                                              },
                                              icon: Icon(Icons.cancel_outlined),
                                              color: Colors.red,
                                              iconSize: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void setStatus(bool status) {
    // TODO: implement setStatus
  }
}

