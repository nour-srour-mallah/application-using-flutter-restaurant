import 'package:flutter/material.dart';
import 'package:haven/view/customer/menu_screen.dart';

import '../view/constance.dart';

class DetailsWedgit extends StatefulWidget {
  final String ids;
  final String des;
  final String urls;
  final String names;
  final String prices;

  DetailsWedgit({
    required this.ids,
    required this.des,
    required this.urls,
    required this.names,
    required this.prices,
  });

  @override
  State<DetailsWedgit> createState() => _DetailsWedgitState();
}

class _DetailsWedgitState extends State<DetailsWedgit> {
  int amount = 0;
  @override
  void inc() {
    amount++;
    setState(() {});
  }

  void dec() {
    if (amount > 0) {
      amount--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String ids = widget.ids;
    String dess = widget.des;
    String urls = widget.urls;
    String names = widget.names;
    String prices = widget.prices;
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Stack(
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                child: Center(
                  child: Image.network(
                    urls,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: kSecondColor,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullMenu(),
                  ),
                );
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                names,
                style: TextStyle(
                    fontSize: 27, fontWeight: FontWeight.bold, color: ktext),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "$prices\$",
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: ktext),
              ),
            ),
            Spacer(),
            FloatingActionButton(
              onPressed: () {
                inc();
              },
              backgroundColor: kSecondColor,
              mini: true,
              child: Icon(
                Icons.add,
                color: ktext,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "${amount}",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: ktext),
            ),
            SizedBox(
              width: 4,
            ),
            FloatingActionButton(
              onPressed: () {
                dec();
              },
              backgroundColor: kSecondColor,
              mini: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Icon(
                  Icons.minimize_sharp,
                  color: ktext,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.34,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              dess,
              style: TextStyle(fontSize: 22, color: ktext),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SizedBox(
            height: size.height * 0.06,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "add to card",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 10, 56, 106),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
