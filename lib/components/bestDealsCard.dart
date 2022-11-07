import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class BestDealsCard extends StatelessWidget {
  final String image;
  final String name;
  final String amount;

  const BestDealsCard(
      {required this.image, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 334,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          kcardBoxShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            child: Image(
              image: AssetImage('images/dashboardImage.png'),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: kNameTextStyle,
                ),
                Text(
                  amount,
                  style: kAmountTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              child: TextButton(
                style: kCardButtonStyle,
                onPressed: () {},
                child: const Text(
                  'See product',
                  style: kCardTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
