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
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                // padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        child: Text("Task Manager", style: TextStyle(fontSize: 35, color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: DataSetBox(),
                    ),
                  ],
                ),
              ),
          ),

        ],
      ),
    );
  }
}
