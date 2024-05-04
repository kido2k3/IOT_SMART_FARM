import 'package:app_mobi/home_page/welcome_box/weather_box/weather_box.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_presenter.dart';
import 'package:app_mobi/home_page/welcome_box/welcome_box_view.dart';
import 'package:app_mobi/my_share/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeBox extends StatefulWidget {
  const WelcomeBox({super.key});

  @override
  State<WelcomeBox> createState() => _WelcomeBoxState();
}

class _WelcomeBoxState extends State<WelcomeBox> implements WelcomeBoxView {
  String _name = "";
  late WelcomeBoxPresenter _presenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = WelcomeBoxPresenter();
    _presenter.attachView(this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //     color: Colors.white.withOpacity(0.5),
      //     borderRadius: BorderRadius.circular(30)),
      margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      padding:const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(
                "Welcome Đạt",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.24,
                ),
            ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/logo2.png'),
                  ),
                ),
              ),
        ],
      ),
    );
  }

}
