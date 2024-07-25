// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:haven/function_front/showdialog.dart';
import 'package:haven/main.dart';
import '../view/constance.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemCard extends StatelessWidget {
  int active_fav = 0;
  late int _index;
  late List _dishIndex;
  late List _url;
  late List _name;
  late List _price;
  ItemCard(int index, List dishIndex, List url, List name, List price) {
    _index = index;
    _url = url;
    _name = name;
    _price = price;
    _dishIndex = dishIndex;
  }
  @override
  Widget build(BuildContext context) {
    Future addFevotite(String email, String idmeal) async {
      var url = "http://$ip/PROJECT/fun/addFavorite.php/";
      var res = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'dishid': idmeal,
        },
      );
      if (res.statusCode == 200) {
        if (jsonDecode(res.body) == null || jsonDecode(res.body) == false) {
          showdialog(
            context,
            "Error",
            "Already exist.",
            "Ok",
          );
        } else {
          showdialog(
            context,
            "Sucsess",
            "Added to favorite.",
            "Ok",
          );
        }
      }
    }

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: size.height * 0.18,
        child: Card(
          color: kitemContainer,
          child: Row(
            children: [
              SizedBox(
                height: double.infinity,
                width: size.width * 0.4,
                child: Image.network(
                  _url[_index],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _name[_index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        _price[_index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " \$",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: size.height * 0.05,
                      width: size.width * 0.2,
                      child: Image.asset("images/star1.png"))
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  //move to favorite
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.9),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      addFevotite(session_email, _dishIndex[_index]);
                    },
                    iconSize: 30,
                    color: const Color.fromARGB(255, 91, 4, 4),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
