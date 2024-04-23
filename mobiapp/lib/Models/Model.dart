import 'package:flutter/material.dart';
import 'package:mobiapp/Views/CreateScreen.dart';
import 'package:mobiapp/Views/HistoryScreen.dart';
import 'package:mobiapp/Views/HomeScreen.dart';
import 'package:mobiapp/Views/LogIn.dart';
import 'package:mobiapp/Views/SignUp.dart';

class Model {

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