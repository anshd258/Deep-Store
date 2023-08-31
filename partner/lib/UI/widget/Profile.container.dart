import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/ridesCard.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Row(
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Padding(
                padding: EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: child,
                ),
              );
            },
            height: 108,
            width: 108,
            fit: BoxFit.fill,
          ),
          Container(
            height: 108,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textwidget("Alice lee ", "", 18, FontWeight.w600),
                textwidget("+91 9762065768", "", 14, FontWeight.w400),
                textwidget("Joined on 12/01/22", "", 14, FontWeight.w400),
                textwidget("Hotel ID:  ", "IDBD900", 14, FontWeight.w600),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row textwidget(
      String text1, String text2, double fontSize, FontWeight fontWeight) {
    return Row(
      children: [
        Text(text1,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.w500)),
        Text(text2,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: fontWeight))
      ],
    );
  }
}