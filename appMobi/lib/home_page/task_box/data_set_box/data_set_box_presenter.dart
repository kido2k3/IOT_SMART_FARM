import 'dart:convert';
import 'dart:ui';

import 'package:app_mobi/home_page/task_box/data_set_box/data_set_box_view.dart';
import 'package:app_mobi/model/network/http_help.dart';
import 'package:app_mobi/mvp/mvp_presenter.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/adafruit_server.dart';
import '../../tool_bar/tool_bar_presenter.dart';

DataSetBoxPresenter dataSetBoxPresenter = DataSetBoxPresenter();

class DataSetBoxPresenter extends MvpPresenter<DataSetBoxView> {

  Future detailrunningtaskOnPressed(BuildContext context, int index, ToolBarPresenter _toolbarpresenter) async {
    showCupertinoDialog (
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                child: Container(
                  color: Colors.white.withOpacity(0.15),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.transparent.withOpacity(0.45),
                    title: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Detail Task",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              deleterunningtaskOnPressed(context, _toolbarpresenter, index);
                            },
                            icon: Icon(Icons.cancel_outlined),
                            color: Colors.red.shade900,
                            iconSize: 35,
                          ),
                        ),
                      ],
                    ),
                    content: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${_toolbarpresenter.RunningDataSet[index]['name']}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'Area: ${_toolbarpresenter.RunningDataSet[index]['area']} \n'
                                '1st Mixer: ${_toolbarpresenter.RunningDataSet[index]['mixer1']} \n'
                                '2nd Mixer: ${_toolbarpresenter.RunningDataSet[index]['mixer2']} \n'
                                '3rd Mixer: ${_toolbarpresenter.RunningDataSet[index]['mixer3']} \n'
                                'Cycle: ${_toolbarpresenter.RunningDataSet[index]['cycle']} \n'
                                'Start Time: ${_toolbarpresenter.RunningDataSet[index]['start time']}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future detailwaitingtaskOnPressed(BuildContext context, int index, ToolBarPresenter _toolbarpresenter) async {
    showCupertinoDialog (
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                child: Container(
                  color: Colors.white.withOpacity(0.15),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.transparent.withOpacity(0.45),
                    title: Row(
                      children: [
                        Expanded(
                          flex: 3,
                            child: Text(
                              "Detail Task",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              deletewaitingtaskOnPressed(context, _toolbarpresenter, index);
                            },
                            icon: Icon(Icons.cancel_outlined),
                            color: Colors.red.shade900,
                            iconSize: 35,
                          ),
                        ),
                      ],
                    ),
                    content: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${_toolbarpresenter.WaitingDataSet[index]['name']}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                    'Area: ${_toolbarpresenter.WaitingDataSet[index]['area']} \n'
                                    '1st Mixer: ${_toolbarpresenter.WaitingDataSet[index]['mixer1']} \n'
                                    '2nd Mixer: ${_toolbarpresenter.WaitingDataSet[index]['mixer2']} \n'
                                    '3rd Mixer: ${_toolbarpresenter.WaitingDataSet[index]['mixer3']} \n'
                                    'Cycle: ${_toolbarpresenter.WaitingDataSet[index]['cycle']} \n'
                                    'Start Time: ${_toolbarpresenter.WaitingDataSet[index]['start time']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future deletewaitingtaskOnPressed (BuildContext context, ToolBarPresenter _toolbarpresenter, int index) async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
          child: Container(
            color: Colors.white.withOpacity(0.15),
            child: AlertDialog(
              backgroundColor: Colors.transparent.withOpacity(0.45),
              content: Text(
                "Are you want to delete this task ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                      Map<String, dynamic> deleteUser = {
                        'code': 'delete',
                        'id': '${_toolbarpresenter.WaitingDataSet[index]["id"]}'
                      };

                      String jsonString = JsonEncoder.withIndent(' ').convert(deleteUser);
                      adafruitServer.mqttHelp.publish('kido2k3/feeds/iot-mobile', jsonString);

                      getView().deleterunningTask(index);
                      Navigator.of(context).pop();
                  },
                  child: Text("Delete", style: TextStyle(color: Colors.red.shade900,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future deleterunningtaskOnPressed (BuildContext context, ToolBarPresenter _toolbarpresenter, int index) async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
          child: Container(
            color: Colors.white.withOpacity(0.15),
            child: AlertDialog(
              backgroundColor: Colors.transparent.withOpacity(0.45),
              content: Text(
                "Are you want to delete this task ?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                      Map<String, dynamic> deleteUser = {
                        'code': 'delete',
                        'id': '${_toolbarpresenter.RunningDataSet[index]["id"]}'
                      };

                      String jsonString = JsonEncoder.withIndent(' ').convert(deleteUser);
                      adafruitServer.mqttHelp.publish('kido2k3/feeds/iot-mobile', jsonString);

                      getView().deletewaitingTask(index);
                      Navigator.of(context).pop();
                  },
                  child: Text("Delete", style: TextStyle(color: Colors.red.shade900,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Future getValue() async {
    checkViewAttached();
    Future.delayed(const Duration(seconds: 5));
    String url = "https://io.adafruit.com/api/v2/kido2k3/feeds/iot-gateway";
    var response = await adafruitServer.httpHelper.fetchText(url);
    if (NetworkUtils.isReqSuccess(response)) {
      String text = response.body;
      final jsonData = await jsonDecode(jsonDecode(text)["last_value"]);
      final code = jsonData["code"];
      final id = jsonData["id"];
      if (code == "w2r") {
        isViewAttached ? getView().w2r(id) : null;
      }
      else if (code == "r2w") {
        isViewAttached ? getView().r2w(id) : null;
      }
      else if (code == "update") {
        final cycle = jsonData["cycle"];
        isViewAttached ? getView().update(id, cycle) : null;
      }
    }
  }

}
