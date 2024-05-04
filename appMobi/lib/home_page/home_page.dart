import 'package:app_mobi/home_page/dashboard_box/dashboard_box.dart';
import 'package:app_mobi/home_page/task_box/task_box.dart';
import 'package:app_mobi/home_page/tool_bar/tool_bar.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box.dart';
import 'package:app_mobi/my_share/background.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // Background(),
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 10,
              child: WelcomeBox()
            ),
            Expanded(
                flex: 25,
                child: DashboardBox()
            ),
            Expanded(
                flex: 30,
                child: TaskBox()
            ),
            Expanded(
                flex: 9,
                child: ToolBar()
            ),
            // SizedBox(
            //   height: 5,
            // ),
          ],
        ),
      ],
    );
  }
}
