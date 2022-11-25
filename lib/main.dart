import 'package:e_commerce_app/providers/cartData.dart';
import 'package:e_commerce_app/renders/cartScreen.dart';
import 'package:e_commerce_app/renders/dashboardScreen.dart';
import 'package:e_commerce_app/renders/emptyCartScreen.dart';
import 'package:e_commerce_app/renders/loginScreen.dart';
import 'package:e_commerce_app/renders/productsDetailsScreen.dart';
import 'package:e_commerce_app/renders/registrationScreen.dart';
import 'package:e_commerce_app/renders/resetPasswordScreen.dart';
import 'package:e_commerce_app/renders/settingsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartData(),
      child: MaterialApp(
        home: LoginScreen(),
        theme: ThemeData(
            primaryColor: const Color(0xFF020E8A), fontFamily: 'Poppins'),
        routes: {
          '/register': (context) => RegistrationScreen(),
          '/login': (context) => LoginScreen(),
          '/reset': (context) => ResetPasswordScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/details': (context) => const ProductDetailsScreen(
                id: 0,
              ),
          '/cart': (context) => CartScreen(
                id: '',
                cart: [],
              ),
          '/empty': (context) => EmptyCartScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      ),
    );
  }
}
