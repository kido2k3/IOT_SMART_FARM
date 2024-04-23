import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobiapp/Controllers/Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Controller _controller = Controller();
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
                  width: 370,
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
                            child: Text(
                              'Đạt',
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
                            left: 331,
                            top: 79,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/60x60"),
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
                            child: Text(
                              'Ho Chi Minh City',
                              textAlign: TextAlign.right,
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
                          SizedBox(width: 150,),
                          Positioned(
                            left: 292,
                            top: 161,
                            child: Text(
                              '01.04.2024',
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
                                child: Text(
                                  '30.254',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
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
                                child: Text(
                                  '80,44%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
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
                                child: Text(
                                  '2.933km/h',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
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
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 260.0, left: 15.0),
                child: Container(
                  width: 380,
                  height: 499,
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
                          width: 352,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            left: 30,
                            top: 340,
                            child: Container(
                              width: 290,
                              height: 130,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Align (
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\t \t Name of Project \n'
                                      '\t \t Concentration of 1st Fertilizer \n '
                                      '\t \t Concentration of 2nd Fertilizer \n '
                                      '\t \t Concentration of 3rd Fertilizer \n'
                                      '\t \t Default Area \n'
                                      '\t \t Cycle \n '
                                      '\t \t Start Time',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Positioned(
                            left: 325,
                            top: 510,
                            child: Container(
                              width: 55,
                              height: 130,
                              decoration: ShapeDecoration(
                                color: Color(0xFFDDDDDD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.cancel_outlined, size: 40,),
                                    ),
                                    SizedBox(height: 15,),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.pause_circle_outline, size: 40,),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            left: 30,
                            top: 476,
                            child: Container(
                              width: 290,
                              height: 130,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Align (
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\t \t Name of Project \n'
                                      '\t \t Concentration of 1st Fertilizer \n '
                                      '\t \t Concentration of 2nd Fertilizer \n '
                                      '\t \t Concentration of 3rd Fertilizer \n'
                                      '\t \t Default Area \n'
                                      '\t \t Cycle \n '
                                      '\t \t Start Time',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Positioned(
                            left: 325,
                            top: 612,
                            child: Container(
                              width: 55,
                              height: 130,
                              decoration: ShapeDecoration(
                                color: Color(0xFFDDDDDD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.cancel_outlined, size: 40,),
                                    ),
                                    SizedBox(height: 15,),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.pause_circle_outline, size: 40,),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            left: 30,
                            top: 612,
                            child: Container(
                              width: 290,
                              height: 130,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Align (
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\t \t Name of Project \n'
                                      '\t \t Concentration of 1st Fertilizer \n '
                                      '\t \t Concentration of 2nd Fertilizer \n '
                                      '\t \t Concentration of 3rd Fertilizer \n'
                                      '\t \t Default Area \n'
                                      '\t \t Cycle \n '
                                      '\t \t Start Time',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Positioned(
                            left: 325,
                            top: 476,
                            child: Container(
                              width: 55,
                              height: 130,
                              decoration: ShapeDecoration(
                                color: Color(0xFFDDDDDD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.cancel_outlined, size: 40,),
                                    ),
                                    SizedBox(height: 15,),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.pause_circle_outline, size: 40,),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 90,
                top: 766,
                child: Container(
                  width: 250,
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
                                _controller.navigateToCreateScreen(context);
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
                      SizedBox(width: 60,),
                      Column(
                        children: [
                          SizedBox(height: 7,),
                          Container(
                            width: 50,
                            height: 50,
                            child: IconButton(
                              onPressed: () {
                                _controller.navigateToHistoryScreen(context);
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