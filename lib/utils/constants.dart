import 'package:flutter/material.dart';

const KTextColor = Color(0xFF000000);
const kIconColor = Color(0xFF9EAABB);
const kIconSize = 30.0;
const kHeadingText = TextStyle(
  fontSize: 31,
  color: KTextColor,
  fontWeight: FontWeight.w600,
);
const kLoginRegisterText = TextStyle(
    fontSize: 15,
    height: 0.1,
    color: Color(0xFF020E8A),
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins');
const kRegularText = TextStyle(
  fontSize: 15,
  height: 0.11,
  color: KTextColor,
  fontWeight: FontWeight.normal,
);
const kLoginText = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);
const kForgotPasswordText = TextStyle(
  fontSize: 12,
  color: KTextColor,
  fontWeight: FontWeight.normal,
);
final kCardButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(
    Color(0xFF0011A8),
  ),
);
const kCardTextStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
final kcardBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.05),
  spreadRadius: 2,
  blurRadius: 7,
  offset: const Offset(4, 8),
);
const kNameTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
);
const kAmountTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);
const kDashboardHeading = TextStyle(
  fontSize: 19.0,
  fontWeight: FontWeight.w600,
);
const kMinusIcon = Icon(
  Icons.remove,
  color: Colors.white,
  size: 10,
);
const kAddIcon = Icon(
  Icons.add,
  color: Colors.white,
  size: 10,
);
const kQuantityButton = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
const kCategoryText = TextStyle(fontWeight: FontWeight.w500, fontSize: 12);
// const kButtonStyle = TextStyle()
