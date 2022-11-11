import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmountButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  AmountButton({required this.icon, required this.onPressed});

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
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
