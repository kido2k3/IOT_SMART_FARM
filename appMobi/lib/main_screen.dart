

import 'package:app_mobi/home_page/home_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: SafeArea(
        child: HomePage(),
      ),
    );
  }

}