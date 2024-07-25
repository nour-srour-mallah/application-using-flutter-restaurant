import 'package:flutter/material.dart';
import 'package:haven/view/customer/menu_screen.dart';
import '../view/customer/home_screen.dart';
import '../view/profile_screen.dart';
import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';
import '../view/customer/favorite_screen.dart';
import '../view/customer/cart.dart';
import '../view/constance.dart';

int Index = 0;

class nav_buttom_bar extends StatefulWidget {
  final int selectedIndex;
  const nav_buttom_bar({
    required this.selectedIndex,
  });

  @override
  State<nav_buttom_bar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<nav_buttom_bar> {
  @override
  Widget build(BuildContext context) {
    return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: const Color.fromARGB(255, 226, 226, 226),
        itemWidth: 47,
        selectedItemBackgroundColor: BlurStyle,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.black,
        unselectedItemLabelColor: const Color.fromARGB(255, 69, 69, 69),
        unselectedItemIconColor: const Color.fromARGB(255, 85, 102, 110),
      ),
      selectedIndex: Index,
      onSelectTab: (IndexedSlot) {
        setState(() {
          Index = IndexedSlot;
          switch (Index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                  context, home_screen.id, (route) => false);
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(
                  context, FullMenu.id, (route) => false);
              break;
            case 2:
              Navigator.pushNamedAndRemoveUntil(
                  context, cart.id, (route) => false);
              break;
            case 3:
              Navigator.pushNamedAndRemoveUntil(
                  context, FavoriteScreen.id, (route) => false);
              break;
            case 4:
              Navigator.pushNamedAndRemoveUntil(
                  context, profile_screen.id, (route) => false);
              break;
            default:
          }
          // Index = 0;
        });
      },
      items: [
        FFNavigationBarItem(
          iconData: Icons.home,
          label: 'Home',
        ),
        FFNavigationBarItem(
          iconData: Icons.restaurant_menu_outlined,
          label: 'Menu',
        ),
        FFNavigationBarItem(
          iconData: Icons.shopping_cart,
          label: 'Cart',
        ),
        FFNavigationBarItem(
          iconData: Icons.favorite,
          label: 'Favorites',
        ),
        FFNavigationBarItem(
          iconData: Icons.person,
          label: 'Profile',
        ),
      ],
    );
  }
}
