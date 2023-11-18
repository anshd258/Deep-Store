import 'package:flutter/material.dart';

class CustomColors {
  static const Color lightBlack70 = Color(0xB2555555);
  static const Color lightBlack90 = Color(0xE5555555);

  static const Color grey = Color(0x99565656);
  static const Color scaffoldBackground = Color(0xFFF5F5F5);
  static const Color green = Color.fromRGBO(73, 204, 115, 1);
  static const Color lightGreen = Color.fromRGBO(168, 217, 119, 1);

  static const Color bottomNavbarLabel = Color.fromRGBO(34, 34, 34, 0.6);

  static const Color gradientColor1 = Color.fromRGBO(49, 207, 221, 1);
  static const Color gradientColor2 = Color.fromRGBO(49, 221, 204, 1);

  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      CustomColors.gradientColor1,
      CustomColors.gradientColor2,
    ],
  );
}
