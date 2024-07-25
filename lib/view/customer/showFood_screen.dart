import 'package:flutter/material.dart';

import '../../function_front/nav_buttom_bar.dart';
import '../constance.dart';
import '../../function_front/item_food.dart';

import 'dart:convert';
import 'package:haven/main.dart';
import 'package:http/http.dart' as http;
import 'package:haven/main.dart';

List<String>? dishesMapUrl;
List<String>? dishesMapName;
List<String>? dishesMapPrice;

class Menu extends StatefulWidget {
  const Menu({super.key});
  static String id = "Menu";

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
    get_dishes();
  }

  Future get_dishes() async {
    var url = "http://$ip/PROJECT/fun/getCart.php";
    dishesMapUrl = [];
    dishesMapName = [];
    dishesMapPrice = [];
    var res = await http.post(
      Uri.parse(url),
      body: {'userid': session_id},
    );

    if (res.statusCode == 200) {
      get_dishes_data(res.body);
    }
  }

  void get_dishes_data(String jsonString) {
    var data = jsonDecode(jsonString) as List<dynamic>;
    for (final meal in data) {
      setState(() {
        dishesMapName?.add(meal['strMeal']);
        dishesMapUrl?.add(meal['strMealThumb']);
        dishesMapPrice?.add(meal['price'] + "*" + meal['number'].toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: const Text(
            'Cart',
            style: TextStyle(fontFamily: "Pacifico"),
          ),
          backgroundColor: const Color.fromARGB(149, 159, 190, 223),
          centerTitle: true,
        ),
        backgroundColor: kMainColor,
        body: GridView.builder(
            shrinkWrap: true,
            itemCount: dishesMapUrl?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.76),
            itemBuilder: (context, index) {
              return ItemFood(
                  index, dishesMapUrl!, dishesMapName!, dishesMapPrice!);
            }),
        bottomNavigationBar: const nav_buttom_bar(selectedIndex: 1),
      ),
    );
  }
}
