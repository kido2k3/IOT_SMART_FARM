import 'package:app_mobi/mvp/mvp_view.dart';

abstract class HomePageView extends MvpView{
  onLoadText(String text);

  onFailLoadText() {}
}