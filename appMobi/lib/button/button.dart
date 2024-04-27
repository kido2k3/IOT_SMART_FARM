

import 'package:app_mobi/button/btn_presenter.dart';
import 'package:app_mobi/button/btn_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatefulWidget {
  const button({super.key});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> implements btnView{
  late btnPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = btnPresenter();
    _presenter.attachView(this);

  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _presenter.onclick,
        child: Text("temp"));
  }
}
