
import 'package:app_mobi/mvp/mvp_view.dart';

abstract class WeatherView extends MvpView{
  void setCity(String city);
  void updateTemperature(double val);
  void updateHumidity(double val);
  void updateTime(String time);
}