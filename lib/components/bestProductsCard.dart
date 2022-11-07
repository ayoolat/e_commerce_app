import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class BestProductsCard extends StatelessWidget {
  final String image;
  final String name;
  final String amount;

  BestProductsCard(
      {required this.image, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 147,
      height: 213,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          kcardBoxShadow,
        ],
      ),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: kNameTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          amount,
                          style: kAmountTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.topRight,
                      child: const Icon(Icons.thumb_up)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
