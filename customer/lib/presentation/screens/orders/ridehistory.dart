import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RidesCard extends StatelessWidget {
  const RidesCard(
      {super.key,
      required this.name,
      required this.pickUpLocation,
      required this.dropOffLocation,
      required this.contactNo});
  final String name;
  final String pickUpLocation;
  final String dropOffLocation;
  final String contactNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RidesDetailsContainer(
              data: name,
              heading: "Guest Name",
              fontSize: 16,
            ),
            RidesDetailsContainer(
              data: contactNo,
              heading: "Contact Number",
              fontSize: 16,
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RidesDetailsContainer(
              data: pickUpLocation,
              heading: "Pickup location",
              fontSize: 16,
            ),
            RidesDetailsContainer(
              data: dropOffLocation,
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
            margin: const EdgeInsets.only(bottom: 1),
            width: double.infinity,
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
            width: double.infinity,
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
