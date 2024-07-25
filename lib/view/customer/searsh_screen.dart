import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haven/function_front/card_menu.dart';
import 'package:haven/function_front/menu_appbar.dart';
import 'package:haven/function_front/rest_menu_info.dart';
import 'package:haven/view/customer/details_screen.dart';
import 'home_screen.dart';
import 'package:haven/main.dart';
import '../constance.dart';
import '../../function_front/item_food.dart';

import 'package:http/http.dart' as http;

List<String>? dishMapIndex;
List<String>? dishesMapdesc;
List<String>? dishesMapUrl;
List<String>? dishesMapName;
List<String>? dishesMapprice;

class searsh_screen extends StatefulWidget {
  const searsh_screen({super.key});
  static String id = "searsh_screen";

  @override
  State<searsh_screen> createState() => _searsh_screenState();
}

class _searsh_screenState extends State<searsh_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_dishes();
  }

  Future get_dishes() async {
    String search = textEditingController_searsh.text;
    var url = "http://$ip/PROJECT/fun/searshMeal.php?s=$search";
    dishMapIndex = [];
    dishesMapdesc = [];
    dishesMapUrl = [];
    dishesMapName = [];
    dishesMapprice = [];
    var res = await http.get(Uri.parse(url));
    print(res.statusCode);
    if (res.statusCode == 200) {
      get_dishes_data(res.body);
    }
  }

  void get_dishes_data(String jsonString) {
    var data = jsonDecode(jsonString);
    var meals = data['meals'] as List<dynamic>;
    for (final meal in meals) {
      setState(() {
        dishMapIndex?.add(meal['idMeal']);
        dishesMapName?.add(meal['strMeal']);
        dishesMapUrl?.add(meal['strMealThumb']);
        dishesMapdesc?.add(meal['description']);

        if (meal.containsKey('price') && meal['price'] != null) {
          dishesMapprice?.add(meal['price']);
        } else {
          dishesMapprice?.add('0');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          backgroundColor: const Color.fromARGB(149, 159, 190, 223),
          centerTitle: true,
        ),
        backgroundColor: kMainColor,
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          id: dishMapIndex![index],
                          des: dishesMapdesc![index],
                          url: dishesMapUrl![index],
                          name: dishesMapName![index],
                          price: dishesMapprice![index],
                        ),
                      ),
                    );
                  },
                  child: ItemCard(
                    index,
                    dishMapIndex!,
                    dishesMapUrl!,
                    dishesMapName!,
                    dishesMapprice!,
                  ),
                );
              },
              childCount: dishesMapUrl?.length ?? 0,
            ),
          ),
        ]),
      ),
    );
  }
}
