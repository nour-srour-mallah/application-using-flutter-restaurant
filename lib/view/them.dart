import 'package:flutter/material.dart';
import '../main.dart';

class them extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<them> {
  // Default theme is light.

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Dark Mode'),
      value: isDark,
      onChanged: (bool value) {
        // When the switch is flipped, update _isDark and rebuild the UI.
        setState(() {
          isDark = value;
          
        });
      },
    );
  }
}
