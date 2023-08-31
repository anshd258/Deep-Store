import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEditFormField extends StatelessWidget {
  String name;
  IconData icon;
  int maxlength;
  String hintText;
  TextInputType keyBoardtype;
  String? Function(String?)? function;
  ProfileEditFormField(
      {super.key,
      required this.maxlength,
      required this.keyBoardtype,
      required this.name,
      required this.function,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: Color(0x99565656),
                        strokeAlign: BorderSide.strokeAlignInside,
                        width: 1),
                  );
    var outlineInputBorderError = OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(153, 255, 54, 54),
                        strokeAlign: BorderSide.strokeAlignInside,
                        width: 1),
                  );
    return SizedBox(
      height: 100,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Color(0xFF555555),
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.48,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: TextFormField(
                keyboardType: keyBoardtype,
                maxLength: maxlength,
                validator: function,
                cursorColor: Color(0x99565656),
                decoration: InputDecoration(
                  errorBorder: outlineInputBorderError,
                  errorStyle: GoogleFonts.nunito(
                    color: Color.fromARGB(153, 255, 54, 54),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                  constraints: BoxConstraints(maxHeight: 70),
                  hintText: hintText,
                  hintStyle: GoogleFonts.nunito(
                    color: Color(0x99565656),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                  focusedBorder: outlineInputBorder,
                  border: outlineInputBorder,
                ),
              ),
            ),
          ]),
    );
  }
}
