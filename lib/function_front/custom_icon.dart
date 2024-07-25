import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final String name;
  const CustomIcon({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "images/icons/icon.png",
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 10, 56, 106)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
