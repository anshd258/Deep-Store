import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.room});
  final String name;
  final String phoneNumber;
  final String email;
  final String room;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        height: 108,
        child: Row(
          children: [
            Image.asset(
              'assets/user.png',
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
              fit: BoxFit.cover,
            ),
            Container(
              height: 108,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textwidget(name, "", 18, FontWeight.w600),
                  textwidget('Phone No. : ', phoneNumber, 14, FontWeight.w400),
                  textwidget('', email, 14, FontWeight.w400),
                  textwidget('Room Number : ', room, 14, FontWeight.w400),
                ],
              ),
            )
          ],
        ),
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
