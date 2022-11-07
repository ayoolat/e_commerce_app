import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/authBackground.dart';
import '../components/authButton.dart';
import '../components/logo.dart';
import '../components/registerLoginInputText.dart';
import '../utils/constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AuthBackGround(
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
              const Flexible(
                child: Text(
                  'Reset Password',
                  style: kHeadingText,
                ),
              ),
              const Text('A password reset link will be sent to your email.'),
              const SizedBox(
                height: 40,
              ),
              RegisterLoginInput(hintText: 'Email Address'),
              const SizedBox(height: 30.0),
              AuthButton(
                text: 'Submit',
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
