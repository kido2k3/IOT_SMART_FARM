import 'package:app_mobi/home_page/task_box/data_set_box/data_set_box.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:app_mobi/home_page/task_box/task_box_view.dart';
import 'package:app_mobi/home_page/tool_bar/tool_bar_presenter.dart';
import 'package:app_mobi/home_page/tool_bar/tool_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../welcome_box/weather_box/weather_box.dart';

class TaskBox extends StatefulWidget {
  const TaskBox({super.key});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> implements ToolBarView {
  late ToolBarPresenter _toolbarpresenter;

  @override
  void initState() {
    super.initState();
    _toolbarpresenter = toolBarPresenter;
    _toolbarpresenter.attachView(this);
    _toolbarpresenter.getStatus();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.15),
        // borderRadius: BorderRadius.circular(30),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      // padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0),
                borderRadius: BorderRadius.circular(20)
              ),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Task Manager", style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: !_toolbarpresenter.isConnected ? null : () => _toolbarpresenter.newtaskOnPressed(context),
                      icon: Icon(
                          Icons.add, size: 38, color: Colors.white,
                      ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: DataSetBox(),
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
