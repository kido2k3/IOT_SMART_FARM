import 'package:app_mobi/home_page/task_box/data_set_box/data_set_box_presenter.dart';
import 'package:app_mobi/home_page/tool_bar/tool_bar_presenter.dart';
import 'package:app_mobi/mvp/mvp_view.dart';

abstract class DataSetBoxView extends MvpView {
  void addWaitingData();

  void w2r(String id);
  void r2w(String id);
  void update(String id, int cycle);

  void deleterunningTask(int index);
  void deletewaitingTask(int index);

}