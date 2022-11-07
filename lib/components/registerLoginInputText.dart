import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterLoginInput extends StatelessWidget {
  final String hintText;

  RegisterLoginInput({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        fillColor: const Color(0xFFBDBFD4).withOpacity(0.3),
        isDense: true,
        contentPadding: const EdgeInsets.all(12.0),
        border: InputBorder.none,
      ),
    );
  }
}
