import 'package:customer/data/models/foodorder.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/helpers/PotraitSizes.dart';
import '../../../middleware/helpers/SizesEnum.dart';
import '../../../middleware/helpers/constants.dart';

class FoodHistory extends StatelessWidget {
  const FoodHistory({super.key, required this.order});
  final FoodOrder order;

  @override
  Widget build(BuildContext context) {
    List<String> itemnames =
        order.items.map((item) => item.food.name.toString()).toList();
    String names = itemnames.join(", ");
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
                textwidget(names, "", 16, FontWeight.w600),
                textwidget(
                    "items : ", "${itemnames.length}", 14, FontWeight.w400),
                textwidget(
                    "Total : ", "₹${order.totalPrice}", 14, FontWeight.w400),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    width: 2, color: const Color.fromRGBO(73, 204, 115, 1))),
            child:  Text(
              order.status.name,
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

// String statusToString(int status) {
//   if (status == 0) return 'Hold';
//   if (status == 1) return 'Processing';
//   if (status == 2) return 'success';
//   if (status == 3) return 'Completed';
//   if (status == 4) return 'Rejected';
//   return '';
// }
