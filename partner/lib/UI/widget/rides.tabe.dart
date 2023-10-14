import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabes extends StatelessWidget {
  String lable;
  int index;
  int currentIndex;
  Tabes(
      {super.key,
      required this.lable,
      required this.index,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lable,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color(0xFF2B2B2B),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 10),
          if (index == currentIndex) ...[
            Container(
              width: 96,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(32, 171, 154, 1),
                    Color.fromRGBO(34, 150, 199, 1)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            )
          ]
        ],
      ),
    );
  }
}
