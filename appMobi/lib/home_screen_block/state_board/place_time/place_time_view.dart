
import 'package:app_mobi/mvp/mvp_view.dart';

abstract class DataView extends MvpView{
  void updateData(String value);
  void onFailUpdate();
}
abstract class BoolView extends MvpView{
  void updateBool(bool value);
  void onFailUpdate();
}
abstract class PlacetimeView  extends DataView{

}