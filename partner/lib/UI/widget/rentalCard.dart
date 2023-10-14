import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RidesCard extends StatelessWidget {
  String data1;
  String data2;
  String data3;
  String data4;
  String heading1;
  String heading2;
  String heading3;
  String heading4;
  RidesCard(
      {super.key,
      required this.data1,
      required this.data2,
      required this.data3,
      required this.data4,
      required this.heading1,
      required this.heading2,
      required this.heading3,
      required this.heading4});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      height: 140,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
                blurStyle: BlurStyle.outer)
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RidesDetailsContainer(
              data: data1,
              heading: heading1,
              fontSize: 15,
            ),
            RidesDetailsContainer(
              data: data2,
              heading: heading2,
              fontSize: 16,
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RidesDetailsContainer(
              data: data3,
              heading: heading3,
              fontSize: 20,
            ),
            RidesDetailsContainer(
              data: data4,
              heading: heading4,
              fontSize: 16,
            )
          ],
        )
      ]),
    );
  }
}

class RidesDetailsContainer extends StatelessWidget {
  String heading;
  String data;
  double fontSize;
  RidesDetailsContainer(
      {super.key,
      required this.heading,
      required this.data,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: Text(
              heading,
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 1),
            child: Text(
              data,
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
