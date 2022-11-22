import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/cartData.dart';
import '../renders/cartScreen.dart';
import '../utils/constants.dart';

class BottomNav extends StatelessWidget {
  final String userId;
  const BottomNav({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(8, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/dashboard');
            },
            child: const Icon(
              Icons.house,
              color: kIconColor,
              size: kIconSize,
            ),
          ),
          const Icon(
            Icons.search,
            color: kIconColor,
            size: kIconSize,
          ),
          GestureDetector(
            onTap: () {
              var cartData = CartData();
              if (cartData.returnCart().isEmpty) {
                Navigator.pushNamed(context, '/empty');
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CartScreen(id: userId, cart: cartData.returnCart()),
                  ),
                );
              }
            },
            child: const Icon(
              Icons.shopping_bag,
              color: kIconColor,
              size: kIconSize,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: const Icon(
              Icons.person,
              color: kIconColor,
              size: kIconSize,
            ),
          ),
        ],
      ),
    );
  }
}
