import 'package:app_mobi/home_page/task_box/task_box.dart';
import 'package:app_mobi/home_page/welcome_box/tool_bar/tool_bar.dart';
import 'package:app_mobi/home_page/welcome_box/weather_box/humidity/humidity.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box.dart';
import 'package:app_mobi/my_share/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Expanded(
          flex: 10,
          child: WelcomeBox(),
        ),
        Expanded(
            flex: 47,
            child: TaskBox()
        ),
        Expanded(
          flex: 5,
          child: ToolBar(),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
