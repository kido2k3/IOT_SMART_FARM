import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobiapp/Controllers/Controller.dart';
import 'package:mobiapp/Views/CreateScreen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 430,
              height: 932,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0x4C00FF19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 430,
                      height: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0x7FFFFDFD),
                        border: Border(
                          left: BorderSide(),
                          top: BorderSide(),
                          right: BorderSide(),
                          bottom: BorderSide(width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _controller.navigateToHomeScreen(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_outlined, size: 30,),
                          ),
                          SizedBox(width: 50,),
                          Text(
                            'Fertilizer Mixer History',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 200,
                    child: Container(
                      width: 380,
                      height: 499,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                  'Item $index'
                              ),
                              subtitle: Text(
                                  'Subtitle $index'
                              ),
                              leading: Text('$index'),
                            );
                          },
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 33,
                  //   top: 129,
                  //   child: Text(
                  //     'Hôm nay',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 33,
                  //   top: 540,
                  //   child: Text(
                  //     'Hôm qua',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 15,
                  //   top: 58,
                  //   child: Container(
                  //     width: 35,
                  //     height: 35,
                  //     decoration: ShapeDecoration(
                  //       image: DecorationImage(
                  //         image: NetworkImage("https://via.placeholder.com/35x35"),
                  //         fit: BoxFit.fill,
                  //       ),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 159,
                  //   child: Text(
                  //     'Name of Project',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 247,
                  //   top: 158,
                  //   child: Text(
                  //     'Tron phan khu I',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 334,
                  //   top: 180,
                  //   child: Text(
                  //     '20',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 334,
                  //   top: 202,
                  //   child: Text(
                  //     '10',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 335,
                  //   top: 224,
                  //   child: Text(
                  //     '15',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 203,
                  //   top: 246,
                  //   child: Text(
                  //     '1',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 189,
                  //   top: 290,
                  //   child: Text(
                  //     '10:21',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 187,
                  //   top: 312,
                  //   child: Text(
                  //     '10:45',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 101,
                  //   top: 180,
                  //   child: Text(
                  //     'Concentration of 1st Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 101,
                  //   top: 202,
                  //   child: Text(
                  //     'Concentration of 2nd Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 224,
                  //   child: Text(
                  //     'Concentration of 3rd Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 101,
                  //   top: 246,
                  //   child: Text(
                  //     'Default Area',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 160,
                  //   top: 268,
                  //   child: Text(
                  //     '4',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 100,
                  //   top: 268,
                  //   child: Text(
                  //     'Cycle',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 101,
                  //   top: 291,
                  //   child: Text(
                  //     'Start Time',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 312,
                  //   child: Text(
                  //     'Stop Time',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 103,
                  //   top: 356,
                  //   child: Text(
                  //     'Name of Project',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 246,
                  //   top: 355,
                  //   child: Text(
                  //     'Tron phan khu II',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 335,
                  //   top: 377,
                  //   child: Text(
                  //     '20',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 338,
                  //   top: 399,
                  //   child: Text(
                  //     '15',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 345,
                  //   top: 421,
                  //   child: Text(
                  //     '5',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 202,
                  //   top: 443,
                  //   child: Text(
                  //     '2',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 194,
                  //   top: 487,
                  //   child: Text(
                  //     '4:21',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 192,
                  //   top: 509,
                  //   child: Text(
                  //     '5:30',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 377,
                  //   child: Text(
                  //     'Concentration of 1st Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 399,
                  //   child: Text(
                  //     'Concentration of 2nd Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 103,
                  //   top: 421,
                  //   child: Text(
                  //     'Concentration of 3rd Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 443,
                  //   child: Text(
                  //     'Default Area',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 161,
                  //   top: 465,
                  //   child: Text(
                  //     '5',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 101,
                  //   top: 465,
                  //   child: Text(
                  //     'Cycle',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 488,
                  //   child: Text(
                  //     'Start Time',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 103,
                  //   top: 509,
                  //   child: Text(
                  //     'Stop Time',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 103,
                  //   top: 572,
                  //   child: Text(
                  //     'Name of Project',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 244,
                  //   top: 571,
                  //   child: Text(
                  //     'Tron phan khu III',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 335,
                  //   top: 593,
                  //   child: Text(
                  //     '20',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 338,
                  //   top: 615,
                  //   child: Text(
                  //     '15',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 345,
                  //   top: 637,
                  //   child: Text(
                  //     '5',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 202,
                  //   top: 659,
                  //   child: Text(
                  //     '3',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 194,
                  //   top: 703,
                  //   child: Text(
                  //     '4:21',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 192,
                  //   top: 725,
                  //   child: Text(
                  //     '5:30',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 593,
                  //   child: Text(
                  //     'Concentration of 1st Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 615,
                  //   child: Text(
                  //     'Concentration of 2nd Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 103,
                  //   top: 637,
                  //   child: Text(
                  //     'Concentration of 3rd Fertilizer',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 659,
                  //   child: Text(
                  //     'Default Area',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 161,
                  //   top: 681,
                  //   child: Text(
                  //     '5',
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w600,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 101,
                  //   top: 681,
                  //   child: Text(
                  //     'Cycle',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 102,
                  //   top: 704,
                  //   child: Text(
                  //     'Start Time',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   left: 103,
                  //   top: 725,
                  //   child: Text(
                  //     'Stop Time',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 15,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //       letterSpacing: -0.24,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
