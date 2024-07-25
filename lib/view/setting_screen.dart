import 'package:flutter/material.dart';
import 'package:haven/main.dart';
import 'them.dart';

class setting_screen extends StatefulWidget {
  const setting_screen({super.key});
  static String id = 'setting_screen';

  @override
  State<setting_screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<setting_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            them(),
            ListTile(
              title: Text('About Us'),
            ),
            ListTile(
              title: Text('Help Center'),
            ),
            ListTile(
              title: Text('Privacy Policy'),
            ),
            ListTile(
              title: Text('Contact Us'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
