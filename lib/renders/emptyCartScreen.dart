import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/BottomNav.dart';

class EmptyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('images/Frame 17.png'),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(
        userId: '13',
      ),
    );
  }
}
