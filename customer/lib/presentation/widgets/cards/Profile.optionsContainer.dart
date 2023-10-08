import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileOptions extends StatelessWidget {
  String lable;
  VoidCallback function;

  ProfileOptions({super.key, required this.function, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: function,
        child: Container(
          width: 328,
          padding: const EdgeInsets.all(16),
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 0.5,
              color: const Color(0x99565656),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF2B2B2B),
              size: 20,
            )
          ]),
        ),
      ),
    );
  }
}
