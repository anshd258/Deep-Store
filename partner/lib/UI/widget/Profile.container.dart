import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatelessWidget {
  String name;
  String phoneNumber;
  String email;
  String providerId;
  double margin;
  int? index;
  int? length;
  ProfileContainer(
      {super.key,
      this.margin = 30,
      this.index,
      this.length,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.providerId});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: EdgeInsets.symmetric(vertical: margin, horizontal: 10),
      child: Stack(
        children: [
          Row(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: child,
                    ),
                  );
                },
                height: 108,
                width: 108,
                fit: BoxFit.fill,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textwidget(name, "", 14, FontWeight.w600),
                    textwidget("+91 ${phoneNumber}", "", 14, FontWeight.w400),
                    textwidget(email, "", 14, FontWeight.w400),
                    textwidget("Hotel ID:  ", providerId, 14, FontWeight.w600),
                  ],
                ),
              )
            ],
          ),
          if (index != null) ...[
            Positioned(
              child: textwidget(
                  "${index}/", length.toString(), 10, FontWeight.w500),
              top: 5,
              right: 5,
            )
          ]
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
