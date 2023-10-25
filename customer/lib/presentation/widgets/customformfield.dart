import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final int? maxlength;
  final String hintText;
  final TextInputType keyBoardtype;
  final String? Function(String?)? function;
  final TextEditingController controller;
  const CustomFormField(
      {super.key,
      this.maxlength,
      required this.keyBoardtype,
      this.name,
      required this.function,
      required this.hintText,
      this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Color(0x99565656),
      ),
    );
    var outlineInputBorderError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Color.fromARGB(153, 255, 54, 54),
      ),
    );
    return SizedBox(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (name != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: const Color(0xFF555555),
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              child: TextFormField(
                controller: controller,
                keyboardType: keyBoardtype,
                maxLength: maxlength,
                validator: function,
                cursorColor: const Color(0x99565656),
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  errorBorder: outlineInputBorderError,
                  errorStyle: GoogleFonts.nunito(
                    color: const Color.fromARGB(153, 255, 54, 54),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                  isDense: true,
                  hintText: hintText,
                  hintStyle: GoogleFonts.nunito(
                    color: const Color(0x99565656),
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
