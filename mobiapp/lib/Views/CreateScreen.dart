import 'package:flutter/material.dart';
import 'package:mobiapp/Controllers/Controller.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final Controller _controller = Controller();
  String? _selectedItem = "Khu 1";
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                  child: Text(
                      'Create a new Fertilizer Mixer',
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
                ),
              ),
              Positioned(
                left: 10,
                top: 220,
                child: Container(
                  width: 390,
                  height: 100,
                  alignment: Alignment.topCenter,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.8999999761581421),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      // SizedBox(height: 5,),
                      Text(
                        'Name of Project',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: -0.24,
                        ),
                      ),
                      // SizedBox(height: 2,),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "..................",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: (screenSize.width - 141)/2,
                top: 650,
                child: Container(
                  width: 141,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: Color(0xFF4CBC57),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text.rich(
                        TextSpan(
                          text:"CREATE",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                            letterSpacing: -0.24,
                          ),
                        )
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 332,
                child: Container(
                  width: 390,
                  height: 290,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.800000011920929),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            'Select Area',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                          SizedBox(width: 90,),
                          Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    _selectedItem ?? '',
                                    style: TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                                  onSelected: (String newValue) {
                                    setState(() {
                                      _selectedItem = newValue;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: 'Area 1',
                                      child: Text('Area 1'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Area 2',
                                      child: Text('Area 2'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Area 3',
                                      child: Text('Area 3'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            'Concentration of 1st Fertilizer',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                          SizedBox(width: 50,),
                          Container(
                            width: 60,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            'Concentration of 2nd Fertilizer',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                          SizedBox(width: 45,),
                          Container(
                            width: 60,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            'Concentration of 3rd Fertilizer',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                          SizedBox(width: 50,),
                          Container(
                            width: 60,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            'Cycle',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                          SizedBox(width: 230,),
                          Container(
                            width: 88,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            'Type Start Time',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                          SizedBox(width: 140,),
                          Container(
                            width: 88,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            'Type Stop Time',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.24,
                            ),
                          ),
                          SizedBox(width: 140,),
                          Container(
                            width: 88,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.25),
                                borderRadius: BorderRadius.circular(10),
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
                left: 17,
                top: 58,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/35x35"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
        ),
      ),
    );
  }
}
