
import 'package:app_mobi/home_page/welcome_box/welcome_box_view.dart';
import 'package:app_mobi/mvp/mvp_presenter.dart';

WelcomeBoxPresenter welcomeBoxPresenter = WelcomeBoxPresenter();

class WelcomeBoxPresenter extends MvpPresenter<WelcomeBoxView>{
  String city = "";
  String time = "";

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
    isViewAttached ? getView().updateTime("$day.$month.$year") : null;
  }
}