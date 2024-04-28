import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mobiapp/Models/Model.dart';

class Controller extends ControllerMVC {

  Model model = Model();

  void addDataSet(String _name, String? _area, double _flow1, double _flow2, double _flow3, double _cycle,
      String _startTime, String _stopTime){
    addDataSet(_name, _area,_flow1, _flow2, _flow3, _cycle, _startTime, _stopTime);
  }

  List<Map<String, dynamic>> getDataSet(){
     return getDataSet();
  }

  void clearDataSet() {
    clearDataSet();
  }

  void navigateToLogIn(BuildContext context) {
    Model.navigateToLogIn(context);
  }

  void navigateToSignUp(BuildContext context) {
    Model.navigateToSignUp(context);
  }

  void navigateToHomeScreen(BuildContext context) {
    Model.navigateToHomeScreen(context);
  }

  void navigateToCreateScreen(BuildContext context) {
    Model.navigateToCreateScreen(context);
  }

  void navigateToHistoryScreen(BuildContext context) {
    Model.navigateToHistoryScreen(context);
  }
}