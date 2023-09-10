import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/helpers/PotraitSizes.dart';
import '../../../middleware/helpers/SizesEnum.dart';
import '../../../middleware/helpers/constants.dart';

class FoodHistory extends StatelessWidget {
  const FoodHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SquicircleContainer(
              height: double.infinity,
              child: Image.network(
                "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textwidget("Ice-cream ", "(x3)", 16, FontWeight.w600),
                textwidget("Name : ", "Alice", 14, FontWeight.w400),
                textwidget("Ph no :", "+91 8764562372", 14, FontWeight.w400),
                textwidget("Total : ", "₹1000", 14, FontWeight.w400),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    width: 2, color: const Color.fromRGBO(73, 204, 115, 1))),
            child: const Text(
              'Ongoing',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(73, 204, 115, 1),
                  fontWeight: FontWeight.w400),
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
                fontWeight: FontWeight.w600)),
        Text(text2,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: fontWeight))
      ],
    );
  }
}
