import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthBackGround extends StatelessWidget {
  final Widget child;

  const AuthBackGround({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/default_background.png'),
              fit: BoxFit.cover),
        ),
        child: child);
  }
}
