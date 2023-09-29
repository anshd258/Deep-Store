import 'package:customer/data/models/rentalrequest.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/helpers/PotraitSizes.dart';
import '../../../middleware/helpers/SizesEnum.dart';
import '../../../middleware/helpers/constants.dart';
import '../../widgets/squicircle.dart';

class RentalHistory extends StatelessWidget {
  const RentalHistory({super.key, required this.request});
  final RentalRequest request;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: SquicircleContainer(
              height: double.infinity,
              child: Image.network(
                "https://dummyimage.com/300",
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
                textwidget(
                    request.rentalId.toString(), "", 16, FontWeight.w600),
                textwidget("items : ", "${request.pickupLocation}", 14,
                    FontWeight.w400),
                textwidget("Total : ", "₹${request.dropOffLocation}", 14,
                    FontWeight.w400),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    width: 2, color: const Color.fromRGBO(73, 204, 115, 1))),
            child: Text(
              request.status.name,
              style: const TextStyle(
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
