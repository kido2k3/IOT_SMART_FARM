import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobiapp/Views/HomeScreen.dart';
import 'package:mobiapp/Views/SignUp.dart';
import 'package:mobiapp/Controllers/Controller.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final Controller _controller = Controller();
  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0x4C00FF19),
                  shape: RoundedRectangleBorder(),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 25,
                      top: 304,
                      child: Container(
                        width: 368,
                        height: 350,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 59,
                      top: 316,
                      child: Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 365,
                      child: Container(
                        width: 339,
                        height: 170,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.800000011920929),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 25,
                      bottom: 120,
                      child: Container(
                        width: 300,
                        height: 100,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 380),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person_outline_outlined),
                                labelText: "Username",
                                hintText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.fingerprint),
                                  labelText: "Password",
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.remove_red_eye_sharp),
                                  )
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text("Forgot Password?"),
                              ),
                            ),
                            SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                _controller.navigateToHomeScreen(context);
                              },
                              child: Text("LOGIN".toUpperCase()),
                            ),
                            SizedBox(height: 100,),
                            Row(
                                children: [
                                  Text("Don't have any Account?"),
                                  TextButton(
                                    onPressed: () {
                                      _controller.navigateToSignUp(context);
                                    },
                                    child: Text.rich(
                                        TextSpan(
                                          text: "Sign Up",
                                          style: TextStyle(color: Colors.black),
                                        )
                                    ),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Positioned( // CHO NAY
                    //   left: 57,
                    //   top: 389,
                    //   child: Container(
                    //     width: 316,
                    //     height: 40,
                    //     decoration: ShapeDecoration(
                    //       color: Color(0x00FFFDFD),
                    //       shape: RoundedRectangleBorder(
                    //         side: BorderSide(width: 0.25),
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 57,
                    //   top: 434,
                    //   child: Container(
                    //     width: 316,
                    //     height: 40,
                    //     decoration: ShapeDecoration(
                    //       color: Color(0x00FFFDFD),
                    //       shape: RoundedRectangleBorder(
                    //         side: BorderSide(width: 0.25),
                    //         borderRadius: BorderRadius.circular(15),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 91,
                    //   top: 401,
                    //   child: SizedBox(
                    //     width: 7,
                    //     height: 21,
                    //     child: Text(
                    //       '|',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 15,
                    //         fontFamily: 'Inter',
                    //         fontWeight: FontWeight.w500,
                    //         height: 0,
                    //         letterSpacing: -0.24,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 65,
                    //   top: 397,
                    //   child: Container(
                    //     width: 25,
                    //     height: 25,
                    //     decoration: ShapeDecoration(
                    //       image: DecorationImage(
                    //         image: NetworkImage("https://via.placeholder.com/25x25"),
                    //         fit: BoxFit.contain,
                    //       ),
                    //       shape: OvalBorder(),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 97,
                    //   top: 397,
                    //   child: Container(
                    //     width: 25,
                    //     height: 25,
                    //     decoration: ShapeDecoration(
                    //       image: DecorationImage(
                    //         image: NetworkImage("https://via.placeholder.com/25x25"),
                    //         fit: BoxFit.contain,
                    //       ),
                    //       shape: OvalBorder(),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 65,
                    //   top: 441,
                    //   child: Container(
                    //     width: 25,
                    //     height: 25,
                    //     decoration: ShapeDecoration(
                    //       image: DecorationImage(
                    //         image: NetworkImage("https://via.placeholder.com/25x25"),
                    //         fit: BoxFit.fill,
                    //       ),
                    //       shape: OvalBorder(),
                    //     ),
                    //   ),
                    // ),
                    // Column(
                    //   children: [
                    //     TextButton(
                    //       onPressed: () {
                    //         _controller.navigateToSignUp(context);
                    //       },
                    //       child: Text.rich(
                    //           TextSpan(
                    //               text: "Don't have an Account?",
                    //               style: Theme.of(context).textTheme.bodyMedium,
                    //               children: const [
                    //                 TextSpan(
                    //                   text: "Sign Up",
                    //                   style: TextStyle(color: Colors.green),
                    //                 )
                    //               ]
                    //           )
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Positioned(
                    //   left: 197,
                    //   top: 448,
                    //   child: SizedBox(
                    //     width: 37,
                    //     child: Text(
                    //       '****',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 15,
                    //         fontFamily: 'Inter',
                    //         fontWeight: FontWeight.w500,
                    //         height: 0,
                    //         letterSpacing: -0.24,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 176,
                    //   top: 539,
                    //   child: SizedBox(
                    //     width: 78,
                    //     height: 21,
                    //     child: Text(
                    //       'LOG IN',
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 20,
                    //         fontFamily: 'Inter',
                    //         fontWeight: FontWeight.w600,
                    //         height: 0,
                    //         letterSpacing: -0.24,
                    //       ),
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