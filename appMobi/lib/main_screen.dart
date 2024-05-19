import 'package:app_mobi/home_page/home_page.dart';
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
            colors: [Colors.green.shade600.withOpacity(0.7), Colors.teal.shade300, Colors.yellow.shade300], // Các màu sắc cho gradient
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 0.5, 1.0], // Điểm dừng của gradient
            tileMode: TileMode.clamp,
          ),
        ),
        child: HomePage(),
      ),
    );
  }

}