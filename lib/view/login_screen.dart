import 'package:flutter/material.dart';

import 'package:haven/main.dart';
import 'package:haven/view/restaurants/rest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'signin_screen.dart';
import 'constance.dart';
import '../function_front/custom_icon.dart';
import '../function_front/showdialog.dart';
import '../function_front/custom_textfield.dart';
import 'customer/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String id = "LoginScreen";
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future loginfun(String email, String pass) async {
      var url = "http://$ip/PROJECT/fun/login.php/";
      var res = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'pass': pass,
        },
      );
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        if (jsonDecode(res.body) == null) {
          showdialog(
            context,
            "Error",
            "Email or Password ont valid.",
            "Try agin",
          );
          passController.text = "";
        } else {
          var red = jsonDecode(res.body) as Map<String, dynamic>;
          // 202010301@aiu.edu.sy
          
          session_id = pass;
          session_email = email;
          session_fname = red['firstname'];
          session_lname = red['lastname'];
          session_photo = base64Decode(red['photo']);
          if (email == "admin") {
            Navigator.pushNamed(context, rest.id);
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => home_screen(),
                ));
          }
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
                const CustomIcon(name: " login"),
                SizedBox(
                  height: heightScreen * .15,
                ),
                CustomTextField(
                  icon: Icons.email,
                  hintText: "Enter your email",
                  controller: emailController,
                ),
                SizedBox(
                  height: heightScreen * .02,
                ),
                CustomTextField(
                  icon: Icons.lock,
                  hintText: "Enter your password",
                  controller: passController,
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
                        String enteredEmail = emailController.text;
                        String enteredPass = passController.text;
                        loginfun(enteredEmail, enteredPass);
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
                      "don't have an account ? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 56, 106),
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          Navigator.pushNamed(context, SigninScreen.id);
                        } catch (e) {}
                      },
                      child: const Text(
                        'sign in',
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
