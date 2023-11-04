import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

RichText textwidget(
    String text1, String text2, double fontSize, FontWeight fontWeight) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(
          text: text1,
          style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.w600)),
      TextSpan(
          text: text2,
          style: GoogleFonts.lato(
              color: Colors.black, fontSize: fontSize, fontWeight: fontWeight))
    ]),
  );
}
