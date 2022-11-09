import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmountButton extends StatelessWidget {
  final Icon icon;

  AmountButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      width: 27,
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xFF0011A8),
            ),
          ),
          onPressed: () {},
          child: icon),
    );
  }
}
