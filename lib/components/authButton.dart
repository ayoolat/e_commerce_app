import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  AuthButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF020E8A),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2))),
              padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
            ),
            child: Text(
              text,
              style: kLoginText,
            ),
          ),
        ),
      ],
    );
  }
}
