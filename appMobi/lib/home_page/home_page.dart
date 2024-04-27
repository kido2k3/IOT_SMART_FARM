import 'package:app_mobi/humidity/humidity.dart';
import 'package:app_mobi/light_intensity/light_intensity.dart';
import 'package:app_mobi/temperature/temperature.dart';
import 'package:flutter/material.dart';

import '../led/led.dart';
import '../pump/pump.dart';
import 'home_page_presenter.dart';
import 'home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageView {
  String _text = "Loading...";

  late HomePagePresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = HomePagePresenter();
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 9,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF008311),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 0),
                          child: const Text(
                            "Phong's Dashboard",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset("images/logo2.png",
                            fit: BoxFit.fitHeight,),
                          ),
                        )
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            color: Colors.lightBlue,
                            margin: EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                  "Temperature",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30
                                    ),
                                  )
                                ),
                                Expanded(
                                    flex: 6,
                                    child: Temperature()
                                ),
                              ],
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.lightGreen,
                            margin: EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Light Intensive",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                ),
                                Expanded(
                                    flex: 6,
                                    child: LightIntensity()
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  )
              ),
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                          ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                            margin: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Humidity",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                ),
                                Expanded(
                                    flex: 6,
                                    child: Humidity()
                                ),
                              ],
                            ),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(

                          )
                      ),
                    ],
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFE70048),
                            ),
                            child: const Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Led",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30
                                    ),),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Led()
                                )
                              ],
                            ),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                            child: const Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Pump",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30
                                  ),),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Pump()
                                )
                              ],
                            ),
                          )
                      ),
                    ],
                  )
              )
            ],
          ),
        )
            // This trailing comma makes auto-formatting nicer for build methods.
            );
  }

  @override
  onLoadText(String text) {
    // TODO: implement onLoadText
    setState(() {
      _text = text;
    });
  }

  @override
  onFailLoadText() {
    // TODO: implement onFailLoadText
    setState(() {
      _text = "Failed";
    });
  }
}
