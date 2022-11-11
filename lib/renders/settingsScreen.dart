import 'package:e_commerce_app/components/BottomNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' Settings',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              WhiteBox(
                icon: const Icon(
                  Icons.person,
                  color: kThemeColor,
                  size: 40,
                ),
                rightIcon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Toluwanimi R. Ayoola',
                        style: kSettingsText,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Edit Additional Content',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' Orders',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              WhiteBox(
                icon: SizedBox(
                  height: 45.0,
                  width: 44.5,
                  child: Image.asset('images/set_cart.png'),
                ),
                rightIcon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                child: const Text(
                  'All Orders',
                  style: kSettingsText,
                ),
              ),
              WhiteBox(
                icon: SizedBox(
                  height: 45.0,
                  width: 44.5,
                  child: Image.asset('images/set_track.png'),
                ),
                rightIcon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                child: const Text(
                  'Track Order',
                  style: kSettingsText,
                ),
              ),
              WhiteBox(
                icon: SizedBox(
                  height: 45.0,
                  width: 44.5,
                  child: Image.asset('images/set_wallet.png'),
                ),
                rightIcon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                child: const Text(
                  'Billing And Addresses',
                  style: kSettingsText,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' Notifications',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              WhiteBox(
                icon: SizedBox(
                  height: 45.0,
                  width: 44.5,
                  child: Image.asset('images/set_noti.png'),
                ),
                rightIcon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                child: const Text(
                  'Notifications',
                  style: kSettingsText,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' Regional',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              WhiteBox(
                icon: SizedBox(
                  height: 45.0,
                  width: 44.5,
                  child: Image.asset('images/set_lang.png'),
                ),
                rightIcon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                child: const Text(
                  'Language',
                  style: kSettingsText,
                ),
              ),
              WhiteBox(
                icon: SizedBox(
                  height: 45.0,
                  width: 44.5,
                  child: Image.asset('images/set_logout.png'),
                ),
                rightIcon: const SizedBox(),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Logout',
                    style: kSettingsText,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(80.0),
                child: Text(
                  'Version 2.0',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class WhiteBox extends StatelessWidget {
  final Widget child;
  final Widget icon;
  final Widget? rightIcon;

  const WhiteBox({
    required this.child,
    required this.icon,
    required this.rightIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: BoxContent(
        icon: icon,
        child: child,
        rightIcon: rightIcon,
      ),
    );
  }
}

class BoxContent extends StatelessWidget {
  final Widget child;
  final Widget icon;
  final Widget? rightIcon;

  const BoxContent(
      {Key? key,
      required this.child,
      required this.icon,
      required this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.all(12.0), child: icon),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(child: child),
          Align(alignment: Alignment.topRight, child: rightIcon)
        ],
      ),
    );
  }
}
