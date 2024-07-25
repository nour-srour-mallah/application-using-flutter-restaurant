import 'package:flutter/material.dart';
import '../view/constance.dart';

class ItemFood extends StatelessWidget {
  late int _index;
  late List _url;
  late List _name;
  late List _price;
  ItemFood(int index, List url, List name, List price) {
    _index = index;
    _url = url;
    _name = name;
    _price = price;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: kitemContainer,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                //  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),

                child: SizedBox(
                  height: size.height * 0.225,
                  child: Image.network(
                    _url[_index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _name[_index],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 17,
                        color: ktext,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: _price[_index++],
                            style: TextStyle(
                                color: ktext,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      color: ktext,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
