import 'package:app_mobi/home_screen_block/state_board/user/user_presenter.dart';
import 'package:app_mobi/home_screen_block/state_board/user/user_view.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> implements UserView{
  String _user = "Pham";
  late UserPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    return Text(
        "$_user",
        style: TextStyle(
        color: Colors.black,
        fontSize: 35,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        height: 0,
        letterSpacing: -0.24,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter =userPresenter;
    _presenter.attachView(this);
    _presenter.getValue();
  }

  @override
  void updateData(String user) {
    // TODO: implement updateData
    setState(() {
      _user = user;
    });
  }

  @override
  void onFailUpdate() {
    // TODO: implement onFailUpdate
    setState(() {
      _user = "Guest";
    });
  }
}
