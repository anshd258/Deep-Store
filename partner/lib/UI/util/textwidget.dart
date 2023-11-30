import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

RichText textwidget(
    String text1, String text2, double fontSize, FontWeight fontWeight,
    {Color color = Colors.black}) {
  return RichText( 
    maxLines: 10,
    softWrap: true,
    textWidthBasis: TextWidthBasis.longestLine,
    overflow: TextOverflow.ellipsis,
    text: TextSpan(
      children: [
        TextSpan(
            text: text1,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.w600)),
        TextSpan(
            text: text2,
            style: GoogleFonts.lato(
                color: color, fontSize: fontSize, fontWeight: fontWeight))
      ],
    ),
  );
}
