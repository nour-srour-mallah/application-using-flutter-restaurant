import 'dart:convert';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:haven/main.dart';
import 'package:haven/view/customer/searsh_screen.dart';
import 'package:haven/view/customer/showFood_screen.dart';
import '../../function_front/nav_buttom_bar.dart';
import '../constance.dart';
import '../../function_front/swiper_data.dart';
import 'package:http/http.dart' as http;

late TextEditingController textEditingController_searsh;

class home_screen extends StatefulWidget {
  const home_screen({super.key});
  static String id = "home_screen";

  @override
  State<home_screen> createState() => _HomePageState();
}

class _HomePageState extends State<home_screen> {
  ///get api
  List<String>? PopulardishesMapUrl;
  List<String>? PopulardishesMapName;
  @override
  void initState() {
    textEditingController_searsh = TextEditingController();
    super.initState();
    get_Popular_dishes();
  }

  Future get_Popular_dishes() async {
    var url = "http://$ip/PROJECT/fun/getPopularMeal.php";
    PopulardishesMapUrl = [];
    PopulardishesMapName = [];
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      get_dishes_data(res.body);
    }
  }

  void get_dishes_data(String jsonString) {
    var data = jsonDecode(jsonString);
    var meals = data['meals'] as List<dynamic>;
    for (final meal in meals) {
      setState(() {
        PopulardishesMapName?.add(meal['strMeal']);
        PopulardishesMapUrl?.add(meal['strMealThumb']);
      });
    }
  }

  @override
  void dispose() {
    textEditingController_searsh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            title: const Text(
              'home',
              style: TextStyle(fontFamily: "Pacifico"),
            ),
            backgroundColor: const Color.fromARGB(149, 159, 190, 223),
            centerTitle: true,
          ),
          backgroundColor: kMainColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 3,
                ),
                //textbox to search
                TextField(
                  controller: textEditingController_searsh,
                  onSubmitted: (textEditingController_searsh) {
                    Navigator.pushNamed(context, searsh_screen.id);
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "search",
                    filled: true,
                    fillColor: kSecondColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                    ),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  //swiper animation
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Discount();
                    },
                    autoplay: true,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeSize: 10,
                        size: 5,
                        color: Colors.white,
                        activeColor: Color.fromARGB(255, 13, 57, 87),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //definition of sections
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Dishes",
                      style: TextStyle(
                        color: ktext,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ///////////////////////////////
                ///
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: PopulardishesMapUrl?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                PopulardishesMapUrl![index],
                                fit: BoxFit.cover,
                                width: 125,
                              ),
                            ),
                          ),
                          Text(PopulardishesMapName![index],
                              style: const TextStyle(fontSize: 14.5)),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const nav_buttom_bar(selectedIndex: 0),
        ),
      ),
    );
  }
}
