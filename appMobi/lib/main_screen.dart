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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.brown], // Các màu sắc cho gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.8], // Điểm dừng của gradient
            tileMode: TileMode.clamp,
          ),
        ),
        child: HomePage(),
      ),
    );
  }

}