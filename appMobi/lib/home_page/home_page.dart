import 'package:app_mobi/home_page/welcome_box/welcome_box.dart';
import 'package:app_mobi/my_share/background.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Column(
          children: [
            Expanded(
              flex: 30,
              child: WelcomeBox()
            ),
            Expanded(
                flex: 80,
                child: Text("data")
            ),
            Expanded(
                flex: 10,
                child: Text("data")
            ),
          ],
        ),
      ],
    );
  }
}
