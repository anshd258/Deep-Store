import 'package:customer/data/models/foodorder.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../middleware/blocs/food/food_cubit.dart';

class FoodHistoryCard extends StatelessWidget {
  const FoodHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<FoodCubit>().state.foodOrderList == null) {
        context.read<FoodCubit>().fetchFoodOrders();
      }
    });
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<FoodCubit>().fetchFoodOrders();
      },
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, foodstate) {
          List<FoodOrder>? data = foodstate.foodOrderList == null
              ? null
              : foodstate.foodOrderList!.reversed.toList();
          return data != null
              ? SizedBox(
                  child: data.isEmpty
                      ? const Center(
                          child: Text('no order yet'),
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            ///
                            bool showDate = false;
                            if (index == 0) {
                              showDate = true;
                            } else {
                              if (DateFormat('dd/MM/yy')
                                      .format(data[index - 1].eta) !=
                                  DateFormat('dd/MM/yy')
                                      .format(data[index].eta)) {
                                showDate = true;
                              }
                            }

                            ///

                            List<String> itemnames = data[index]
                                .items
                                .map((item) => item.itemName.toString())
                                .toList();
                            String names = itemnames.join(", ");
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (showDate)
                                    Builder(builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 10),
                                        child: Text(
                                            ' ${DateFormat('dd/MM/yy').format(data[index].eta)}'),
                                      );
                                    }),
                                  Card(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius(
                                            cornerRadius: 10)),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        textwidget(
                                                          "Total Items ordered ",
                                                          "${itemnames.length}",
                                                          16,
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        textwidget(
                                                          "Total amount to pay",
                                                          "₹${data[index].totalPrice}",
                                                          16,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Expanded(
                                                    child: textwidget(
                                                      'Items',
                                                      names,
                                                      16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                          },
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
