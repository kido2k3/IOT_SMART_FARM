
import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box_view.dart';
import 'package:app_mobi/mvp/mvp_presenter.dart';

class WeatherBoxPresenter extends MvpPresenter<WeatherView>{
  void getCity(){
    checkViewAttached();
    String name = "Ho Chi Minh City";
    isViewAttached ? getView().setCity(name) : null;
  }
  void getTime(){
    checkViewAttached();
    DateTime time = DateTime.now();
    final day = time.day;
    final month = time.month;
    final year = time.year;
    isViewAttached ? getView().updateTime("$day/$month/$year") : null;
  }
}