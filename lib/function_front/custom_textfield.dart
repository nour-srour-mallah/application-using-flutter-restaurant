import 'package:flutter/material.dart';
import '../view/constance.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  const CustomTextField({
    required this.icon,
    required this.hintText,
    required this.controller,
  });
  String _errorMessage(String str) {
    switch (hintText) {
      case 'Enter your name':
        return 'name is empty';
      case 'Enter your email':
        return 'email is empty';
      case 'Enter your password':
        return 'password is empty';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(hintText);
          }
          return null;
        },
        obscureText: hintText == "Enter your password" ? true : false,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondColor,
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: const Color.fromARGB(255, 86, 141, 201),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
