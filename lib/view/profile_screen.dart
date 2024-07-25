import 'package:flutter/material.dart';
import '../function_front/nav_buttom_bar.dart';
import '../main.dart';
import 'login_screen.dart';
import 'constance.dart';
import 'setting_screen.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});
  static String id = "profile_screen";

  @override
  State<profile_screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Pacifico",
          ),
        ),
        backgroundColor: Color.fromARGB(255, 76, 120, 167),
        centerTitle: true,
      ),
      backgroundColor: kMainColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              color: Color.fromARGB(255, 76, 120, 167),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: kSecondColor,
                      radius: 40,
                      backgroundImage: MemoryImage(session_photo),
                    ),
                  ),
                  Text(
                    "$session_fname$session_lname",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: kSecondColor,
                      fontFamily: "Pacifico",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kSecondColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Edit your data'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Setting'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => setting_screen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      session_email = "";
                      session_fname = "";
                      session_lname = "";
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.id, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: nav_buttom_bar(selectedIndex: 4),
    );
  }
}
