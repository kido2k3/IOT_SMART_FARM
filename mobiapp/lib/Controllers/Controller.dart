import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mobiapp/Models/Model.dart';

class Controller extends ControllerMVC {

  void navigateToLogIn(BuildContext context) {
    Model.navigateToLogIn(context);
  }

  void navigateToSignUp(BuildContext context) {
    Model.navigateToSignUp(context);
  }

  void navigateToHomeScreen(BuildContext context) {
    Model.navigateToHomeScreen(context);
  }
}