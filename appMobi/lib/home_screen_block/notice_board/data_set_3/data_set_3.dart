import 'package:app_mobi/home_screen_block/home_screen/home_screen.dart';
import 'package:app_mobi/home_screen_block/notice_board/data_set_3/data_set_3_presenter.dart';
import 'package:app_mobi/home_screen_block/notice_board/data_set_3/data_set_3_view.dart';
import 'package:flutter/material.dart';

class Dataset3 extends StatefulWidget {
  const Dataset3({super.key});

  @override
  State<Dataset3> createState() => _Dataset3State();
}

class _Dataset3State extends State<Dataset3> implements Dataset3View{
  String _name = "Cay lua";
  double _flow1 = 0, _flow2 = 0, _flow3 = 0, _area = 0;
  double _cycle = 0, _starttime = 0, _stoptime = 0;


  @override
  Widget build(BuildContext context) {
    return Text(
      "\t \t Name of Project: $_name\n"
          "\t \t Concentration of 1st Fertilizer: $_flow1\n"
          "\t \t Concentration of 2nd Fertilizer: $_flow2\n"
          "\t \t Concentration of 3rd Fertilizer: $_flow3\n"
          "\t \t Default Area:  $_area\n"
          "\t \t Cycle: $_cycle\n"
          "\t \t Start Time:  $_starttime\n"
          "\t \t Stop Time: $_stoptime",
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        height: 0,
        letterSpacing: -0.24,
      ),
    );
  }
}

