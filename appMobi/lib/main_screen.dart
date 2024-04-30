import 'package:app_mobi/home_page/home_page.dart';
import 'package:app_mobi/main.dart';
import 'package:app_mobi/my_share/background.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("SCHEDULING APP"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 27,
          fontFamily: 'Intel',
        ),
        backgroundColor: Colors.green,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
                colors: [
                  Colors.greenAccent.withOpacity(0.7),
                  Colors.lightBlueAccent.withOpacity(0.7),
                ],
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: const SafeArea(
        child: HomePage(),
      ),
    );
  }

}