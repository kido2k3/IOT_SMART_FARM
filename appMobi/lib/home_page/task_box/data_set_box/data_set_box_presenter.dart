import 'dart:convert';

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
    showDialog (
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white.withOpacity(0.8999999761581421),
          title: Text("Detail task ${_toolbarpresenter.RunningDataSet[index]['name']}",
              style: MyTextStyle.welcome),
          content: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Text(
              '\t \t Name: ${_toolbarpresenter.RunningDataSet[index]['name']} \n'
                  '\t \t Area: ${_toolbarpresenter.RunningDataSet[index]['area']} \n'
                  '\t \t 1st Mixer: ${_toolbarpresenter.RunningDataSet[index]['mixer1']} \n'
                  '\t \t 2nd Mixer: ${_toolbarpresenter.RunningDataSet[index]['mixer2']} \n'
                  '\t \t 3rd Mixer: ${_toolbarpresenter.RunningDataSet[index]['mixer3']} \n'
                  '\t \t Cycle: ${_toolbarpresenter.RunningDataSet[index]['cycle']} \n'
                  '\t \t Start Time: ${_toolbarpresenter.RunningDataSet[index]['start time']}',
              style: MyTextStyle.weather),
          ),
        );
      },
    );
  }

  Future detailwaitingtaskOnPressed(BuildContext context, int index, ToolBarPresenter _toolbarpresenter) async {
    showDialog (
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white.withOpacity(0.8999999761581421),
          title: Text("Detail task ${_toolbarpresenter.WaitingDataSet[index]['name']}",
              style: MyTextStyle.welcome),
          content: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Text(
                '\t \t Name: ${_toolbarpresenter.WaitingDataSet[index]['name']} \n'
                    '\t \t Area: ${_toolbarpresenter.WaitingDataSet[index]['area']} \n'
                    '\t \t 1st Mixer: ${_toolbarpresenter.WaitingDataSet[index]['mixer1']} \n'
                    '\t \t 2nd Mixer: ${_toolbarpresenter.WaitingDataSet[index]['mixer2']} \n'
                    '\t \t 3rd Mixer: ${_toolbarpresenter.WaitingDataSet[index]['mixer3']} \n'
                    '\t \t Cycle: ${_toolbarpresenter.WaitingDataSet[index]['cycle']} \n'
                    '\t \t Start Time: ${_toolbarpresenter.WaitingDataSet[index]['start time']}',
                style: MyTextStyle.weather),
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
