import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haven/function_front/nav_buttom_bar.dart';
import '../constance.dart';
import '../../function_front/item_favorites.dart';
import 'package:http/http.dart' as http;
import 'package:haven/main.dart';

List<String>? _dishIndex;
List<String>? _url;
List<String>? _name;
List<String>? _price;
List<String>? _description;
// int? index = 0;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static String id = "FavoriteScreen";

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // Fetch data before building the widget
  void fetchData() async {
    // Your API call to fetch favorite items
    var url = "http://$ip/PROJECT/fun/getFavorite.php";
    var res = await http.post(Uri.parse(url), body: {'userid': session_id});

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body) as List<dynamic>;
      _dishIndex = [];
      _url = [];
      _name = [];
      _price = [];
      _description = [];
      for (final meal in data) {
        setState(() {
          _dishIndex?.add(meal['idMeal'].toString());
          _url?.add(meal['strMealThumb']);
          _name?.add(meal['strMeal']);
          _price?.add(meal['price']);
          _description?.add(meal['description']);
        });
      }
      // index = _name?.length;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the fetchData method in initState
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.8;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: const Text(
            'favorites',
            style: TextStyle(fontFamily: "Pacifico"),
          ),
          backgroundColor: const Color.fromARGB(149, 159, 190, 223),
          centerTitle: true,
        ),
        backgroundColor: kMainColor,
        body: ListView.builder(
          itemCount: _name?.length,
          itemBuilder: (context, index) {
            return ItemFavorite(
              size: size,
              index: index,
              dishIndex: _dishIndex!,
              url: _url!,
              name: _name!,
              price: _price!,
              description: _description!,
            );
          },
        ),
        bottomNavigationBar: const nav_buttom_bar(selectedIndex: 3),
      ),
    );
  }
}
