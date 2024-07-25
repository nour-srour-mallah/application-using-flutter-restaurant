import 'package:flutter/material.dart';

import '../view/constance.dart';
import '../view/customer/home_screen.dart';

class MenuAppBar extends StatelessWidget {
  const MenuAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "images/menu.jpg",
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: InkWell(
          child: CircleAvatar(
            backgroundColor: kSecondColor,
            child: Icon(Icons.arrow_back_ios_new),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => home_screen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
