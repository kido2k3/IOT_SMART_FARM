import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobiapp/Controllers/Controller.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  List<Map<String,dynamic>> DataSet = [];
  final Controller _controller = Controller();

  String? _area = "....";
  String _name ='';
  double _flow1 =0.0;
  double _flow2 =0.0;
  double _flow3 =0.0;
  double _cycle =0.0;
  String _startTime = '00:00';
  String _stopTime = '00:00';

  void addDataSet(String _name, String? _area, double _flow1, double _flow2, double _flow3, double _cycle,
      String _startTime, String _stopTime, List<Map<String, dynamic>> DataSet) {
    DataSet.add({
      'name': _name,
      'area': _area,
      'concentration': {
        'flow1': _flow1,
        'flow2': _flow2,
        'flow3': _flow3,
      },
      'cycle': _cycle,
      'starttime': _startTime,
      'stoptime': _stopTime,
    });
  }

  void _updateStartTime(String newTime) {
    setState(() {
      _startTime = newTime;
    });
  }

  void _updateStopTime(String newTime) {
    setState(() {
      _stopTime = newTime;
    });
  }

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
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            _controller.navigateToHomeScreen(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_outlined, size: 30,),
                      ),
                      Text(
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
                    ],
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
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "..................",
                          ),
                          onChanged: (name){
                            _name = name;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: (screenSize.width - 141)/2,
                bottom: 180,
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
                    onPressed: () {
                      addDataSet(_name, _area, _flow1, _flow2, _flow3, _cycle, _startTime, _stopTime, DataSet);
                      DataSet.clear();
                    },
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
                  height: 345,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.800000011920929),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(25),
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
                                    _area ?? '',
                                    style: TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                                  onSelected: (area) {
                                    setState(() {
                                      _area = area;
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
                          SizedBox(width: 10,),
                          Container(
                            width: 100,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                              ],
                              onChanged: (flow1){
                                setState(() {
                                  _flow1 = double.parse(flow1);
                                });
                              },
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
                          SizedBox(width: 10,),
                          Container(
                            width: 95,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                              ],
                              onChanged: (flow2){
                                setState(() {
                                  _flow2 = double.parse(flow2);
                                });
                              },
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
                          SizedBox(width: 10,),
                          Container(
                            width: 100,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.25),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                              ],
                              onChanged: (flow3){
                                setState(() {
                                  _flow3 = double.parse(flow3);
                                });
                              },
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
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                          SizedBox(width: 115,),
                          Container(
                            width: 115,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 50,
                                      child: TextField(
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            if (int.parse(value) < 60) {
                                              _updateStartTime('$value:${_startTime.split(':')[1]}');
                                            }
                                          } else if (value.length == 1) {
                                            _updateStartTime('$value:${_startTime.split(':')[1]}');
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(2),
                                        ],
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText: 'HH',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ':',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Container(
                                      width: 50,
                                      child: TextField(
                                        onChanged: (value) {
                                          if (value.length == 2) {
                                            if (int.parse(value) < 60) {
                                              _updateStartTime('${_startTime.split(':')[0]}:$value');
                                            }
                                          } else if (value.length == 1) {
                                            _updateStartTime('${_startTime.split(':')[0]}:$value');
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(2),
                                        ],
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText: 'MM',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                          SizedBox(width: 115,),
                          Container(
                            width: 115,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 50,
                                    child: TextField(
                                      onChanged: (value) {
                                        if (value.length == 2) {
                                          if (int.parse(value) < 60) {
                                            _updateStopTime('$value:${_stopTime.split(':')[1]}');
                                          }
                                        } else if (value.length == 1) {
                                          _updateStopTime('$value:${_stopTime.split(':')[1]}');
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: 'HH',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ':',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Container(
                                    width: 50,
                                    child: TextField(
                                      onChanged: (value) {
                                        if (value.length == 2) {
                                          if (int.parse(value) < 60) {
                                            _updateStopTime('${_stopTime.split(':')[0]}:$value');
                                          }
                                        } else if (value.length == 1) {
                                          _updateStopTime('${_stopTime.split(':')[0]}:$value');
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: 'MM',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ),
                        ],
                      ),
                    ],
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
