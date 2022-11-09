import 'package:e_commerce_app/renders/cartScreen.dart';
import 'package:e_commerce_app/renders/dashboardScreen.dart';
import 'package:e_commerce_app/renders/emptyCartScreen.dart';
import 'package:e_commerce_app/renders/loginScreen.dart';
import 'package:e_commerce_app/renders/productsDetailsScreen.dart';
import 'package:e_commerce_app/renders/registrationScreen.dart';
import 'package:e_commerce_app/renders/resetPasswordScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(
          primaryColor: const Color(0xFF020E8A), fontFamily: 'Poppins'),
      routes: {
        '/register': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen(),
        '/reset': (context) => ResetPasswordScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/details': (context) => ProductDetailsScreen(),
        '/cart': (context) => CartScreen(),
        '/empty': (context) => EmptyCartScreen(),
      },
    );
  }
}
