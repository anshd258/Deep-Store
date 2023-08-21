import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RidesCard extends StatelessWidget {
  const RidesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RidesDetailsContainer(
              data: "Alice lee",
              heading: "Guest Name",
              fontSize: 20,
            ),
            RidesDetailsContainer(
              data: "+91 9871085060",
              heading: "Contact Number",
              fontSize: 16,
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RidesDetailsContainer(
              data: "Gyatso orchid",
              heading: "Pickup location",
              fontSize: 20,
            ),
            RidesDetailsContainer(
              data: "Spiti Valley",
              heading: "Drop off location",
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
    return Container(
      width: 150,
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 1),
            width: double.infinity,
            child: Text(
              heading,
              style: GoogleFonts.lato(
                color: Color(0xFF555555),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            width: double.infinity,
            child: Text(
              data,
              style: GoogleFonts.lato(
                color: Color(0xFF555555),
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
