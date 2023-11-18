import 'package:customer/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static TextStyle title({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        color: color ?? CustomColors.lightBlack90,
        fontSize: 26,
        letterSpacing: -0.28,
        fontWeight: fontWeight ?? FontWeight.w600);
  }
  static TextStyle heading({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        fontSize: 20, fontWeight: fontWeight ?? FontWeight.w600, color: color);
  }

  static TextStyle subHeading({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        fontSize: 18, fontWeight: fontWeight ?? FontWeight.w600, color: color);
  }

  static TextStyle body({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        color: color ?? CustomColors.lightBlack70,
        fontSize: 16,
        letterSpacing: -0.28,
        fontWeight: fontWeight ?? FontWeight.w600);
  }
  static TextStyle subBody({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.lato(
        color: color ?? CustomColors.lightBlack70,
        fontSize: 12,
        letterSpacing: -0.28,
        fontWeight: fontWeight ?? FontWeight.w600);
  }

}
