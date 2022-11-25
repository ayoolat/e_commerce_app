import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/authBackground.dart';
import '../components/authButton.dart';
import '../utils/constants.dart';
import '../components/logo.dart';
import '../components/registerLoginInputText.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AuthBackGround(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(),
              const SizedBox(
                height: 30.0,
              ),
              const SizedBox(
                height: 42,
                child: Text(
                  'Let’s Login',
                  style: kHeadingText,
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: kRegularText,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                    child: const Text(
                      'Register',
                      style: kLoginRegisterText,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              RegisterLoginInput(
                hintText: 'Email Address',
                obscureText: false,
                onChange: (String value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RegisterLoginInput(
                hintText: 'Password',
                obscureText: true,
                onChange: (String value) {
                  password = value;
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/reset');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: const Text('Forgot password',
                    style: kForgotPasswordText, textAlign: TextAlign.left),
              ),
              const SizedBox(height: 30.0),
              AuthButton(
                text: 'Log in',
                onPressed: () {
                  var currentUser = _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (currentUser != null) {
                    Navigator.pushNamed(context, '/dashboard');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
