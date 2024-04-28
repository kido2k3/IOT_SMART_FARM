import 'package:flutter/material.dart';
import 'package:mobiapp/Views/CreateScreen.dart';
import 'package:mobiapp/Views/HistoryScreen.dart';
import 'package:mobiapp/Views/HomeScreen.dart';
import 'package:mobiapp/Views/LogIn.dart';
import 'package:mobiapp/Views/SignUp.dart';

class DataSet {
  late String name;
  late String area;
  late Map<double, dynamic> flow;
  late double cycle;
  late String startTime;
  late String stopTime;

  DataSet({required this.name, required this.area, required this.flow, required this.cycle, required this.startTime, required this.stopTime});
}

class Model {
  static List<Map<String, dynamic>> DataSet=[];

  static void addDataSet(String _name, String? _area, double _flow1, double _flow2, double _flow3, double _cycle,
      String _startTime, String _stopTime) {
    DataSet.add({
      'name': _name,
      'area': _area,
      'concentration': {
        'flow1': _flow1,
        'flow2': _flow2,
        'flow3': _flow3,
      },
      'cycle': _cycle,
      'starttime': _startTime,
      'stoptime': _stopTime,
    });
  }

  // print('name: ${DataSet[0]['name']}');
  // print('area: ${DataSet[0]['area']}');
  // print('concentration 1st fertilizer: ${DataSet[0]['concentration']['flow1']}');
  // print('concentration 2nd fertilizer: ${DataSet[0]['concentration']['flow2']}');
  // print('concentration 3rd fertilizer: ${DataSet[0]['concentration']['flow3']}');
  // print('cycle: ${DataSet[0]['cycle']}');
  // print('starttime: ${DataSet[0]['starttime']}');
  // print('stoptime: ${DataSet[0]['stoptime']}');
  static List<Map<String, dynamic>> getDataSet() {
    return DataSet.isNotEmpty ? DataSet: [];
  }

  static void clearDataSet() {
    DataSet.clear();
  }

  static void navigateToLogIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogIn()),
    );
  }

  static void navigateToSignUp(BuildContext context) {
      Navigator.push(
        context!,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
  }

  static void navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  static void navigateToCreateScreen(BuildContext context) {
    Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => CreateScreen()),
    );
  }

  static void navigateToHistoryScreen(BuildContext context) {
    Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => HistoryScreen()),
    );
  }
}