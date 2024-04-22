import 'dart:ui';
import 'package:mobiapp/Views/LogIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobiapp/Controllers/Controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    top: 100,
                    child: Container(
                      width: 368,
                      height: 565,
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
                    top: 115,
                    child: Text(
                      'Sign Up',
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
                    top: 180,
                    child: Container(
                      width: 339,
                      height: 470,
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
                    bottom: 45,
                    child: Container(
                      width: 300,
                      height: 70,
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
                          SizedBox(height: 200),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "First Name",
                              hintText: "First Name",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: "Last Name",
                              hintText: "Last Name",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              labelText: "Phone Number",
                              hintText: "Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: "Email",
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              labelText: "Password",
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              labelText: "Confirm Your Password",
                              hintText: "Confirm Your Password",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              _controller.navigateToLogIn(context);
                            },
                            child: Text("SIGN UP".toUpperCase()),
                          ),
                          SizedBox(height: 30,),
                          Row(
                              children: [
                                Text("Already have an account?"),
                                TextButton(
                                  onPressed: () {
                                    _controller.navigateToLogIn(context);
                                  },
                                  child: Text.rich(
                                      TextSpan(
                                        text: "Log In",
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