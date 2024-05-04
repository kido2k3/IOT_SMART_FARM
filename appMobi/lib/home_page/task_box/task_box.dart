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

class _TaskBoxState extends State<TaskBox> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text("\t Scheduled Tasks", style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold)),
                ),
                Container(
                    child: DataSetBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
