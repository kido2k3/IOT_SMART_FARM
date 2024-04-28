import 'package:app_mobi/home_screen_block/home_screen/home_screen.dart';
import 'package:app_mobi/home_screen_block/notice_board/cancel_button/cancel_button_presenter.dart';
import 'package:app_mobi/home_screen_block/notice_board/cancel_button/cancel_button_view.dart';
import 'package:flutter/material.dart';

class Cancelbutton extends StatefulWidget {
  const Cancelbutton({super.key});

  @override
  State<Cancelbutton> createState() => _CancelbuttonState();
}

class _CancelbuttonState extends State<Cancelbutton> implements CancelbuttonView{
  late CancelbuttonPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          navigateToCreateScreen(context);
        },
        icon: Icon(Icons.cancel_outlined, size: 40, color: Colors.red,),
    );
  }

  @override
  void initState(){
    super.initState();
    _presenter = cancelbuttonPresenter;
    _presenter.attachView(this);
  }

  @override
  void navigateToCreateScreen(BuildContext context) {
    Navigator.push(
        context!,
        MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void navigateToHistoryScreen(BuildContext context) {
    Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}
