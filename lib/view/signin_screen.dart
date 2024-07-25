import 'package:flutter/material.dart';

import 'package:haven/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'constance.dart';
import '../function_front/custom_icon.dart';
import '../function_front/custom_textfield.dart';
import 'login_screen.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  static String id = 'signinScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final eemailController = TextEditingController();
  final ppassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future signinfun(String email, String pass) async {
      var url = "http://$ip/PROJECT/fun/Register.php/";
      var res = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'pass': pass,
        },
      );
      if (res.statusCode == 200) {
        if (jsonDecode(res.body) == false) {
          showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('Email or Password ont valid.'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Try agin'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      ppassController.text = "";
                    },
                  ),
                ],
              );
            },
          );
        } else if (jsonDecode(res.body) == true) {
          // 202010301@aiu.edu.sy
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      }
    }

    double heightScreen = MediaQuery.of(context).size.height;
    // Wrap the entire content in GestureDetector
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kMainColor,
          body: Form(
            key: _globalKey,
            child: ListView(
              children: [
                const CustomIcon(name: " Signin"),
                SizedBox(
                  height: heightScreen * .15,
                ),
                CustomTextField(
                  icon: Icons.email,
                  hintText: "Enter your email",
                  controller: eemailController,
                ),
                SizedBox(
                  height: heightScreen * .02,
                ),
                CustomTextField(
                  icon: Icons.lock,
                  hintText: "Enter your password",
                  controller: ppassController,
                ),
                SizedBox(
                  height: heightScreen * .05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 10, 56, 106),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        // Add logic for successful validation
                        String enteredEmail = eemailController.text;
                        String enteredPass = ppassController.text;
                        signinfun(enteredEmail, enteredPass);
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightScreen * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "do have an account ? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 56, 106),
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          Navigator.pushNamed(context, LoginScreen.id);
                        } catch (e) {}
                      },
                      child: const Text(
                        'login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 253, 253, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
