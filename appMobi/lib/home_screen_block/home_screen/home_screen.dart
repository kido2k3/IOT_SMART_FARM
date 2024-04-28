import 'package:app_mobi/home_screen_block/notice_board/cancel_button/cancel_button.dart';
import 'package:app_mobi/home_screen_block/notice_board/data_set_1/data_set_1.dart';
import 'package:app_mobi/home_screen_block/state_board/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_mobi/home_screen_block/state_board/temperature/temperature.dart';
import 'package:app_mobi/home_screen_block/state_board/wind/wind.dart';
import 'package:app_mobi/home_screen_block/state_board/humidity/humidity.dart';
// import 'package:app_mobi/home_screen_block/state_board/user/user.dart';
import 'package:app_mobi/home_screen_block/state_board/place_time/place_time.dart';

import '../notice_board/data_set_2/data_set_2.dart';
import '../notice_board/data_set_3/data_set_3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0x9D4AFA5E),
            shape: RoundedRectangleBorder(
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 40,
                child: Container(
                  width: (screenSize.width - 2*20),
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 5,),
                          Positioned(
                            left: 44,
                            top: 87,
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 44,
                            top: 87,
                            child: User(),
                          ),
                          Positioned(
                            left: 331,
                            top: 79,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/logo2.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(side: BorderSide(width: 2)),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Positioned(
                            left: 63,
                            top: 140,
                            child: Place(),
                          ),
                          SizedBox(width: 150*(screenSize.width/150-2),),
                          Positioned(
                            left: 292,
                            top: 161,
                            child: Time(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Positioned(
                                left: 76,
                                top: 165,
                                child: Text(
                                  'Temperature',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Positioned(
                                left: 88,
                                top: 213,
                                child: Temperature(),
                              ),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column(
                            children: [
                              Positioned(
                                left: 198,
                                top: 165,
                                child: Text(
                                  'Humidity',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Positioned(
                                left: 201,
                                top: 213,
                                child: Humidity()
                              ),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column(
                            children: [
                              Positioned(
                                left: 317,
                                top: 165,
                                child: Text(
                                  'Wind',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Positioned(
                                left: 291,
                                top: 213,
                                child: Wind()
                              ),
                              SizedBox(width: 30,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 260,
                left: 20,
                  child: Container(
                    width: (screenSize.width - 2*20),
                    height: (screenSize.height - 200 - 2*40 - 20*4.5),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Positioned(
                          left: 30,
                          top: 270,
                          child: Container(
                            width: (screenSize.width - 2*30),
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color(0xFF71CC51),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'IoT K232',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: ((screenSize.height - 200 - 2*40 - 20*2) - (60 + 20*4)),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Positioned(
                                      left: 30,
                                      top: 340,
                                      child: Container(
                                        width: (screenSize.width - 2*30),
                                        height: 130,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Align (
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 290*((screenSize.width - 2*40)/290 - 0.25),
                                                child: Dataset1(),
                                              ),
                                              Cancelbutton(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Positioned(
                                      left: 30,
                                      top: 476,
                                      child: Container(
                                        width: (screenSize.width - 2*30),
                                        height: 130,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 290*((screenSize.width - 2*40)/290 - 0.25),
                                              child: Dataset2(),
                                            ),
                                            Cancelbutton(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Positioned(
                                      left: 30,
                                      top: 612,
                                      child: Container(
                                        width: (screenSize.width - 2*30),
                                        height: 130,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 290*((screenSize.width - 2*40)/290 - 0.25),
                                              child: Dataset3(),
                                            ),
                                            Cancelbutton(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                ),
              ),
              Positioned(
                left: screenSize.width/2 - 100,
                top: 260 + (screenSize.height - 200 - 2*40 - 20*4.5) + 10,
                child: Container(
                  width: 200,
                  height: 93,
                  decoration: ShapeDecoration(
                    color: Color(0x7FFFFDFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Column(
                        children: [
                          SizedBox(height: 7,),

                          Container(
                            width: 50,
                            height: 50,
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(Icons.add_circle_outline_outlined, size: 40,),
                            ),
                          ),
                          Text(
                            'Create a new \nFertilizer Mixer',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(width: 60,),
                      Column(
                        children: [
                          SizedBox(height: 7,),
                          Container(
                            width: 50,
                            height: 50,
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(Icons.history_outlined, size: 40,),
                            ),
                          ),
                          Text(
                            'Fertilizer Mixer\nHistory',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 21,
                top: 240,
                child: Text(
                  'Notice-board',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: -0.24,
                  ),
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }
}