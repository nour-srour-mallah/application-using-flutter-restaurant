import 'package:flutter/material.dart';

Future<void> showdialog(BuildContext context, String title, String textcontent,
    String Textbutton) async {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(textcontent),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(Textbutton),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
