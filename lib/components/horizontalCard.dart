import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HorizontalCard extends StatelessWidget {
  final String image;
  final String name;
  final String amount;
  const HorizontalCard(
      {required this.image, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103.0,
      width: 254.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          kcardBoxShadow,
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: SizedBox(
              height: 103.0,
              width: 104.0,
              child: Image(
                image: AssetImage('images/dashboardImage.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const SizedBox(
                    height: 28.0,
                    width: 28.0,
                    child: ColoredBox(
                      color: Color(0xFFF44336),
                      child: Icon(
                        Icons.monitor_heart,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  name,
                  style: kNameTextStyle,
                  textAlign: TextAlign.start,
                ),
                Text(
                  amount,
                  style: kAmountTextStyle,
                  textAlign: TextAlign.end,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 29,
                    width: 88,
                    child: TextButton(
                      onPressed: () {},
                      style: kCardButtonStyle,
                      child: const Text(
                        'Add to cart',
                        style: kCardTextStyle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
