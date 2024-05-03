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
  const DataSetBox({super.key});

  @override
  State<DataSetBox> createState() => _DataSetBoxState();
}

class _DataSetBoxState extends State<DataSetBox> implements DataSetBoxView, TaskBoxView, ToolBarView {
  late ToolBarPresenter _toolbarpresenter;
  late DataSetBoxPresendter _datasetboxpresenter;

  @override
  void initState() {
    super.initState();
    _toolbarpresenter = toolBarPresenter;
    _toolbarpresenter.attachView(this);
    _datasetboxpresenter = dataSetBoxPresendter;
    _datasetboxpresenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8999999761581421),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Running", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _toolbarpresenter.DataSet.length,
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
                                          onPressed: () {_datasetboxpresenter.detailtaskOnPressed(context, index, _toolbarpresenter);},
                                          child: Text(
                                            '\t Name: ${_toolbarpresenter.DataSet[index]['name']} \n'
                                                '\t Start Time: ${_toolbarpresenter.DataSet[index]['starttime']}',
                                            style: TextStyle(fontSize: 18, color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              User user = User('delete', '', '${_toolbarpresenter.DataSet[index]['id']}', '', '', '', '', '', '');
                                              _toolbarpresenter.userMap = user.toJson();
                                              adafruitServer.mqttHelp.publish('datpham0411/feeds/iot-mobile', _toolbarpresenter.userMap.toString());

                                              _toolbarpresenter.DataSet.removeAt(index);
                                              if (_toolbarpresenter.DataSet.length == 0) {
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
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8999999761581421),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Waiting", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    height: 100,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _toolbarpresenter.DataSet.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.8999999761581421),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {_datasetboxpresenter.detailtaskOnPressed(context, index, _toolbarpresenter);},
                                          child: Text(
                                            '\t \t Name: ${_toolbarpresenter.DataSet[index]['name']} \n'
                                                '\t \t Start Time: ${_toolbarpresenter.DataSet[index]['starttime']}',
                                            style: TextStyle(fontSize: 18, color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              User user = User('delete', '', '${_toolbarpresenter.DataSet[index]['id']}', '', '', '', '', '', '');
                                              _toolbarpresenter.userMap = user.toJson();
                                              adafruitServer.mqttHelp.publish('datpham0411/feeds/iot-mobile', _toolbarpresenter.userMap.toString());

                                              _toolbarpresenter.DataSet.removeAt(index);                                });
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void setStatus(bool status) {
  }
}
