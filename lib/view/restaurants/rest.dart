import 'package:flutter/material.dart';
import 'package:haven/function_front/showdialog.dart';

import 'package:haven/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constance.dart';
import 'package:haven/function_front/custom_icon.dart';
import 'package:haven/function_front/custom_textfield.dart';

class rest extends StatelessWidget {
  rest({super.key});
  static String id = 'rest';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final urlController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future Submitfun(String id, String name, String photoUrl, String descrition,
        String price) async {
      var url = "http://$ip/PROJECT/fun/addMeal.php/";
      var res = await http.post(
        Uri.parse(url),
        body: {
          'idMeal': id,
          'strMeal': name,
          'strMealThumb': photoUrl,
          'description': descrition,
          'price': price,
        },
      );
      if (res.statusCode == 200) {
        if (jsonDecode(res.body) == false) {
          print("false");
        } else if (jsonDecode(res.body) == true) {
          showdialog(
            context,
            "Success",
            "Mail $name was added.",
            "OK",
          );
          idController.text = "";
          nameController.text = "";
          urlController.text = "";
          descriptionController.text = "";
          priceController.text = "";
        }
      }
    }

    Future Deletefun(String id) async {
      var url = "http://$ip/PROJECT/fun/deleteMeal.php/";
      var res = await http.post(
        Uri.parse(url),
        body: {
          'idMeal': id,
        },
      );
      if (res.statusCode == 200) {
        if (jsonDecode(res.body) == false) {
          print("false");
        } else if (jsonDecode(res.body) == true) {
          showdialog(
            context,
            "Success",
            "Mail $id was deleted.",
            "OK",
          );
          idController.text = "";
          nameController.text = "";
          urlController.text = "";
          descriptionController.text = "";
          priceController.text = "";
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
          appBar: AppBar(
            title: const Text('Logout'),
            backgroundColor: Color.fromARGB(255, 10, 56, 106),
          ),
          backgroundColor: kMainColor,
          body: Form(
            key: _globalKey,
            child: ListView(
              children: [
                const CustomIcon(name: " Restorant"),
                SizedBox(
                  height: heightScreen * 0.015,
                ),
                CustomTextField(
                  icon: Icons.edit,
                  hintText: "Enter dish id",
                  controller: idController,
                ),
                SizedBox(
                  height: heightScreen * .015,
                ),
                CustomTextField(
                  icon: Icons.edit,
                  hintText: "Enter dish name",
                  controller: nameController,
                ),
                SizedBox(
                  height: heightScreen * .015,
                ),
                CustomTextField(
                  icon: Icons.edit,
                  hintText: "Enter dish pic url",
                  controller: urlController,
                ),
                SizedBox(
                  height: heightScreen * .015,
                ),
                CustomTextField(
                  icon: Icons.edit,
                  hintText: "Enter dish description",
                  controller: descriptionController,
                ),
                SizedBox(
                  height: heightScreen * .015,
                ),
                CustomTextField(
                  icon: Icons.edit,
                  hintText: "Enter dish price",
                  controller: priceController,
                ),
                SizedBox(
                  height: heightScreen * .015,
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
                        String enteredId = idController.text;
                        String enteredName = nameController.text;
                        String enteredUrl = urlController.text;
                        String enteredDescrition = descriptionController.text;
                        String enteredPrice = priceController.text;
                        Submitfun(enteredId, enteredName, enteredUrl,
                            enteredDescrition, enteredPrice);
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                        String enteredId = idController.text;
                        Deletefun(enteredId);
                      }
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
