import 'package:flutter/material.dart';

import '../view/constance.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: kSecondColor,
      child: SizedBox(
        height: size.height * 0.25,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Haven menu",
                style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF868686),
                  ),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.1),
                        child: CircleAvatar(
                          radius: 2,
                          backgroundColor: Color(0xFF868686),
                        ),
                      ),
                      Text(" food , Drinks , Dessert")
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const Text("4.7"),
                  const SizedBox(width: 2),
                  Icon(Icons.star_rate_sharp),
                  const SizedBox(width: 4),
                  const Text("200+ Ratings")
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  children: [
                    const InfoCard(
                      icon: Icons.delivery_dining,
                      title: "Free",
                      subtitle: "Delivery",
                    ),
                    const SizedBox(width: 16),
                    const InfoCard(
                      icon: Icons.schedule,
                      title: "25",
                      subtitle: "Minutes",
                    ),
                    const SizedBox(width: 15),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () {
                        //goooo to cart
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Color.fromARGB(255, 34, 69, 164),
                        fixedSize: const Size(140, 40),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 34, 69, 164)),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: Text(
                        "Take to cart".toUpperCase(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}
