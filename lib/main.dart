import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:haven/view/customer/menu_screen.dart';
import 'package:haven/view/login_screen.dart';
import 'package:haven/view/signin_screen.dart';
import 'package:haven/view/profile_screen.dart';
import 'package:haven/view/customer/home_screen.dart';
import 'package:haven/view/customer/showFood_screen.dart';
import 'package:haven/view/customer/favorite_screen.dart';
import 'view/splash_screen.dart';
import 'view/customer/searsh_screen.dart';
import 'view/them.dart';
import 'view/restaurants/rest.dart';
import 'package:haven/view/customer/cart.dart';

late String session_id;
late String session_email;
late String session_fname;
late String session_lname;
late Uint8List session_photo;
late bool isDark = false;

final String ip = "192.168.137.107";
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    dynamic theem() {
      return SwitchListTile(
        title: Text('Dark Mode'),
        value: isDark,
        onChanged: (valuetheem) {
          // When the switch is flipped, update _isDark and rebuild the UI.
          setState(() {
            isDark = valuetheem;
          });
        },
      );
    }

    return MaterialApp(
      theme: isDark
          ? ThemeData.dark()
          : ThemeData(
              scaffoldBackgroundColor: Color.fromARGB(255, 159, 190, 223),
              appBarTheme: AppBarTheme(
                  backgroundColor: Color.fromARGB(149, 159, 190, 223)),
              textTheme: TextTheme(
                  bodySmall: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
      debugShowCheckedModeBanner: false,
      initialRoute: Splash_screen.id,
      routes: {
        Splash_screen.id: (context) => const Splash_screen(),
        LoginScreen.id: (context) => LoginScreen(),
        home_screen.id: (context) => home_screen(),
        SigninScreen.id: (context) => SigninScreen(),
        Menu.id: (context) => Menu(),
        FavoriteScreen.id: (context) => FavoriteScreen(),
        profile_screen.id: (context) => profile_screen(),
        searsh_screen.id: (context) => searsh_screen(),
        rest.id: (context) => rest(),
        FullMenu.id: (context) => FullMenu(),
        cart.id: (context) => cart(),
      },
    );
  }
}
