import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Image(image: AssetImage('images/logo.png')),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Kleine.",
          style: TextStyle(
              fontSize: 19, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
