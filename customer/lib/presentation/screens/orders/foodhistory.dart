import 'package:customer/data/models/foodorder.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/blocs/foodcubit/food_cubit.dart';
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
      child: LayoutBuilder(builder: (context, constraints) {
        return SquicircleContainer(
          margin: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.05,
              vertical: constraints.maxWidth * 0.025),
          child: Card(
            elevation: 4,
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Items',
                        //   style: GoogleFonts.lato(
                        //       color: Colors.black,
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w600),
                        // ),
                        textwidget(
                          'Items',
                          names,
                          16,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textwidget(
                              "Items ordered ",
                              "${itemnames.length}",
                              16,
                            ),
                            textwidget(
                              "Total amount",
                              "₹${order.totalPrice}",
                              16,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Builder(builder: (context) {
                      Color color = Color.fromRGBO(73, 204, 115, 1);
                      if (order.status == RequestStatus.hold)
                        color = Colors.red;
                      return Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(width: 2, color: color)),
                        child: Center(
                          child: Text(
                            order.status.name,
                            style: TextStyle(
                                fontSize: 14,
                                color: color,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Column textwidget(String text1, String text2, double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize - 2,
                fontWeight: FontWeight.w400)),
        Text(text2,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize + 2,
                fontWeight: FontWeight.w600))
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
