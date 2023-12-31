import 'package:customer/constants/textstyles.dart';
import 'package:customer/data/models/foodorder.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/blocs/food/food_cubit.dart';
import '../../../constants/enums.dart';

class FoodOrderCard extends StatelessWidget {
  const FoodOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<FoodCubit>().state.foodOrderList == null)
        context.read<FoodCubit>().fetchFoodOrders();
    });
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<FoodCubit>().fetchFoodOrders();
      },
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, foodstate) {
          List<FoodOrder>? data = foodstate.foodOrderList;

          return data != null
              ? SizedBox(
                  child: data.isEmpty
                      ? const Center(
                          child: Text('no order yet'),
                        )
                      : ListView(
                          children: data.map((order) {
                            List<String> itemnames = order.items
                                .map((item) => item.itemName.toString())
                                .toList();
                            String names = itemnames.join(", ");
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              shape: SmoothRectangleBorder(
                                  borderRadius:
                                      SmoothBorderRadius(cornerRadius: 10)),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textwidget(
                                              'Items',
                                              names,
                                              16,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Builder(builder: (context) {
                                      Color color =
                                          const Color.fromRGBO(73, 204, 115, 1);
                                      if (order.status == OrderStatus.failed) {
                                        color = Colors.red;
                                      }
                                      return Container(
                                        padding: const EdgeInsets.all(4),
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                width: 1.5, color: color)),
                                        child: Center(
                                          child: Text(order.status.name,
                                              style: CustomTextStyles.body(
                                                  color: color)),
                                        ),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Column textwidget(String text1, String text2, double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1,
            style: GoogleFonts.lato(
                color: const Color.fromRGBO(44, 44, 44, 1),
                fontSize: fontSize - 2,
                fontWeight: FontWeight.w400)),
        const SizedBox(
          height: 5,
        ),
        Text(text2,
            style: GoogleFonts.lato(
                color: const Color.fromRGBO(44, 44, 44, 1),
                fontSize: fontSize + 2,
                fontWeight: FontWeight.w500))
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
