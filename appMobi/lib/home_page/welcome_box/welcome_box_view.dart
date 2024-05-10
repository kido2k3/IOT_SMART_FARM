
import 'package:app_mobi/mvp/mvp_view.dart';

abstract class WelcomeBoxView extends MvpView{
  void setCity(String city);
  void updateTime(String time);
}