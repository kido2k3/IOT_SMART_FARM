import 'package:app_mobi/mvp/mvp_view.dart';
import 'package:flutter/cupertino.dart';

abstract class CancelbuttonView extends MvpView{
  void navigateToCreateScreen(BuildContext context);
  void navigateToHistoryScreen(BuildContext context);
}