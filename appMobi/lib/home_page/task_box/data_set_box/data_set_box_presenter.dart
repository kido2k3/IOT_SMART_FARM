import 'package:app_mobi/home_page/task_box/data_set_box/data_set_box_view.dart';
import 'package:app_mobi/mvp/mvp_presenter.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tool_bar/tool_bar_presenter.dart';

DataSetBoxPresendter dataSetBoxPresendter = DataSetBoxPresendter();

class DataSetBoxPresendter extends MvpPresenter<DataSetBoxView> {

  Future detailtaskOnPressed(BuildContext context, int index, ToolBarPresenter _toolbarpresenter) async {
    showDialog (
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white.withOpacity(0.8999999761581421),
          title: Text("Detail task ${_toolbarpresenter.DataSet[index]['name']}",
              style: MyTextStyle.welcome),
          content: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Text(
              '\t \t Name: ${_toolbarpresenter.DataSet[index]['name']} \n'
                  '\t \t Area: ${_toolbarpresenter.DataSet[index]['area']} \n'
                  '\t \t 1st Mixer: ${_toolbarpresenter.DataSet[index]['mixer1']} \n'
                  '\t \t 2nd Mixer: ${_toolbarpresenter.DataSet[index]['mixer2']} \n'
                  '\t \t 3rd Mixer: ${_toolbarpresenter.DataSet[index]['mixer3']} \n'
                  '\t \t Cycle: ${_toolbarpresenter.DataSet[index]['cycle']} \n'
                  '\t \t Start Time: ${_toolbarpresenter.DataSet[index]['starttime']}',
              style: MyTextStyle.weather),
          ),
        );
      },
    );
  }

}
