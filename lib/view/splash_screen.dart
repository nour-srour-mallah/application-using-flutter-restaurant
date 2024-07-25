import 'package:flutter/material.dart';
import 'dart:async';
import 'constance.dart';
import 'login_screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});
  static String id = "Splash_screen";

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kMainColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "images/logo.png",
              ),
              const Padding(
                padding: EdgeInsets.only(top: 300, left: 80),
                child: Text(
                  "welcom to the restaurant vip ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(186, 34, 82, 106),
                      fontFamily: "Pacifico"),
                ),
              )
            ],
          ),
        ],
      )),
    ));
  }
}
