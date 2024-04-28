
import 'package:app_mobi/home_page/welcome_box/welcome_box_view.dart';
import 'package:app_mobi/mvp/mvp_presenter.dart';


class WelcomeBoxPresenter extends MvpPresenter<WelcomeBoxView>{
  void getName(){
    checkViewAttached();
    String name = "Phong";
    isViewAttached ? getView().setName(name) : null;
  }
}