import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxesWidget extends StatelessWidget {
  const TaxesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.30),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("sgst (%6)",
                  style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
              Text("₹ 99",
                  style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("convenience charges",
                  style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
              Text("₹ 99",
                  style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("sgst (%6)",
                  style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
              Text("₹ 99",
                  style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ]),
    );
  }
}