import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/authBackground.dart';
import '../components/authButton.dart';
import '../utils/constants.dart';
import '../components/logo.dart';
import '../components/registerLoginInputText.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AuthBackGround(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Logo(),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Let’s Register',
                  style: kHeadingText,
                ),
                Row(
                  children: [
                    const Text(
                      'Do you have an account?',
                      style: kRegularText,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft),
                      child: const Text(
                        'Log in',
                        style: kLoginRegisterText,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                RegisterLoginInput(hintText: 'First Name'),
                const SizedBox(
                  height: 15,
                ),
                RegisterLoginInput(hintText: 'Last Name'),
                const SizedBox(
                  height: 15,
                ),
                RegisterLoginInput(hintText: 'Email Address'),
                const SizedBox(
                  height: 15,
                ),
                RegisterLoginInput(hintText: 'Password'),
                const SizedBox(height: 30.0),
                AuthButton(
                  text: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
