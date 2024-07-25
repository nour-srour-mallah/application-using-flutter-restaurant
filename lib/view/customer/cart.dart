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
import 'showFood_screen.dart';

class cart extends StatefulWidget {
  const cart({super.key});
  static String id = "cart";
  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Menu();
  }
}
