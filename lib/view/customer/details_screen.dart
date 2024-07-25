import 'package:flutter/material.dart';
import '../../function_front/Details.dart';
import '../constance.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  final String des;
  final String url;
  final String name;
  final String price;

  DetailsScreen({
    required this.id,
    required this.des,
    required this.url,
    required this.name,
    required this.price,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String ids = widget.id;
    String dess = widget.des;
    String urls = widget.url;
    String names = widget.name;
    String prices = widget.price;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: DetailsWedgit(
          ids: ids,
          des: dess,
          urls: urls,
          names: names,
          prices: prices,
        ),
      ),
    );
  }
}
