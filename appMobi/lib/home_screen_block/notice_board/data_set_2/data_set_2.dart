import 'package:app_mobi/home_screen_block/home_screen/home_screen.dart';
import 'package:app_mobi/home_screen_block/notice_board/data_set_1/data_set_1_presenter.dart';
import 'package:app_mobi/home_screen_block/notice_board/data_set_2/data_set_2_view.dart';
import 'package:flutter/material.dart';

class Dataset2 extends StatefulWidget {
  const Dataset2({super.key});

  @override
  State<Dataset2> createState() => _Dataset2State();
}

class _Dataset2State extends State<Dataset2> implements Dataset2View{
  String _name = "Cay lua";
  double _flow1 = 122222, _flow2 = 35222.45, _flow3 = 12221.33, _area = 0;
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

