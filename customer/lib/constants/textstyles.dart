import 'package:customer/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static TextStyle title({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        color: color ?? CustomColors.lightBlack90,
        fontSize: 24,
        letterSpacing: -0.28,
        fontWeight: fontWeight ?? FontWeight.w600);
  }

  static TextStyle heading({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        fontSize: 18, fontWeight: fontWeight ?? FontWeight.w600, color: color);
  }

  static TextStyle subHeading({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        fontSize: 16, fontWeight: fontWeight ?? FontWeight.w600, color: color);
  }

  static TextStyle body({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        color: color ?? CustomColors.lightBlack70,
        fontSize: 14,
        letterSpacing: -0.28,
        fontWeight: fontWeight ?? FontWeight.w600);
  }

  static TextStyle subBody({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        color: color ?? CustomColors.lightBlack70,
        fontSize: 13,
        letterSpacing: -0.28,
        fontWeight: fontWeight ?? FontWeight.w600);
  }

  static TextStyle bottomNavBarLabel({bool selected = false}) {
    return GoogleFonts.lato(
        foreground: selected
            ? (Paint()
              ..shader = CustomColors.gradient
                  .createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 300.0)))
            : null,
        color: selected ? null : CustomColors.bottomNavbarLabel,
        height: 1.5,
        fontSize: 14,
        fontWeight: FontWeight.w600);
  }
}
