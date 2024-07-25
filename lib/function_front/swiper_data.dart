import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 110, 159),
                Color.fromARGB(255, 174, 194, 208),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color.fromARGB(100, 222, 237, 247)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "order the best italian dish with a discount:",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(
                                "50 % OFF",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(
                  "images/meat.png",
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ))
        ],
      ),
    );
  }
}
