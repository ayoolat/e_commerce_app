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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: kNameTextStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      amount,
                      style: kAmountTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              child: TextButton(
                style: kCardButtonStyle,
                onPressed: () {
                  Navigator.pushNamed(context, '/details');
                },
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
