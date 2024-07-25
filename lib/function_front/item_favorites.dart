import 'package:flutter/material.dart';

import '../view/constance.dart';

class ItemFavorite extends StatelessWidget {
  final Size size;
  final int index;
  final List<String> dishIndex;
  final List<String> url;
  final List<String> name;
  final List<String> price;
  final List<String> description;
  ItemFavorite({
    Key? key,
    required this.size,
    required this.index,
    required this.dishIndex,
    required this.url,
    required this.name,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            height: size.height * 0.50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: kitemContainer),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      url[index], // Use the image URL from the API
                      width: double.infinity, fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, bottom: 3),
                  child: Row(
                    children: [
                      Text(
                        name[index], // Use the name from the API
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ktext,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 6),
                  child: Text(
                    description[
                        index], // Replace with the actual category from the API
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${price[index]} \$", // Use the price from the API
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ktext,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
