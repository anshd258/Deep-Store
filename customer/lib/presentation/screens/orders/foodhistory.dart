import 'package:customer/data/models/foodorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/blocs/food/food_cubit.dart';
import '../../../middleware/helpers/constants.dart';

class FoodHistory extends StatelessWidget {
  const FoodHistory({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FoodCubit>().fetchFoodOrders();
      // context.read<RentalCubit>().fetchAllRentalRequests();
      // context.read<RideCubit>().fetchRideRequests();
    });
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<FoodCubit>().fetchFoodOrders();
      },
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, foodstate) {
          List<FoodOrder>? data = foodstate.foodOrderList;

          // data =data != null ? data.reversed.toList() : data;
          return data != null
              ? SizedBox(
                  child: data.isEmpty
                      ? const Center(
                          child: Text('no order yet'),
                        )
                      : ListView(
                          children: data.map((order) {
                            List<String> itemnames = order.items
                                .map((item) => item.food.name.toString())
                                .toList();
                            String names = itemnames.join(", ");
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.05,
                                    vertical: constraints.maxWidth * 0.025),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                        Expanded(
                                          flex: 2,
                                          child: Builder(builder: (context) {
                                            Color color = const Color.fromRGBO(
                                                73, 204, 115, 1);
                                            if (order.status ==
                                                RequestStatus.failed) {
                                              color = Colors.red;
                                            }
                                            return Container(
                                              padding: const EdgeInsets.all(6),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      width: 2, color: color)),
                                              child: Center(
                                                child: Text(
                                                  order.status.name,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: color,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                            });
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
                color: Colors.black,
                fontSize: fontSize - 2,
                fontWeight: FontWeight.w400)),
        const SizedBox(
          height: 5,
        ),
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
