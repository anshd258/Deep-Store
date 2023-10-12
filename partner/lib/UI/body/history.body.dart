import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/rideCard.dart';
import 'package:partner/UI/widget/rentalCard.dart';
import 'package:partner/middleware/HistoryCubit/food_history_cubit.dart';
import 'package:partner/middleware/HistoryCubit/history_filter_cubit.dart';
import 'package:partner/middleware/HistoryCubit/rental_history_cubit.dart';
import 'package:partner/middleware/HistoryCubit/ride_history_cubit.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryFilterCubit, HistoryFilterState>(
        builder: (context, state) {
      var value = context.watch<HistoryFilterCubit>();
      if (value.tabIndex == 1) {
        return SizedBox(
            height: 516,
            child: BlocConsumer<FoodHistoryCubit, FoodHistoryState>(
              listener: (context, state) {
                if (state is FoodHistoryError) {
                  errorSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is FoodHistoryError) {
                  return errorIcon;
                } else if (state is FoodHistoryLoading) {
                  return progressIndicator;
                } else if (state is FoodHistoryLoaded) {
                  if (state.foodRequest!.orders!.isEmpty) {
                    return noAcceptedRequest;
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                          children: state.foodRequest!.orders!
                              .map((e) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Room no ${e.user}",
                                          style: GoogleFonts.lato(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              showDialog(
                                                barrierLabel: "cancle",
                                                barrierDismissible: true,
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    elevation: 5,
                                                    content: Container(
                                                      height: 200,
                                                      width: 300,
                                                      child: Column(
                                                          children: e.items!
                                                              .map((e) => Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          "${e.name} (X${e.quantity})"),
                                                                      Text(
                                                                          "₹${e.quantity}"),
                                                                    ],
                                                                  ))
                                                              .toList()),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: RidesCard(
                                              heading1: "Guest name",
                                              heading2: "items ordered",
                                              heading3: "Contact no",
                                              heading4: "Total amount",
                                              data1: e.user!.contact!,
                                              data2: e.items!.length.toString(),
                                              data3: e.user!.contact.toString(),
                                              data4: "₹${e.total!.toString()}",
                                            )),
                                      ],
                                    ),
                                  ))
                              .toList()),
                    );
                  }
                } else {
                  return Center();
                }
              },
            ));
      } else if (value.tabIndex == 2) {
        return SizedBox(
            height: 516,
            child: BlocConsumer<RideHistoryCubit, RideHistoryState>(
              listener: (context, state) {
                if (state is RideHistoryError) {
                  errorSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is RideHistoryError) {
                  return errorIcon;
                } else if (state is RideHistoryLoading) {
                  return progressIndicator;
                } else if (state is RideHistoryLoaded) {
                  if (state.rideRequest!.rides == null) {
                    return noAcceptedRequest;
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Room no ",
                            style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Column(
                              children: state.rideRequest!.rides!
                                  .map((e) => RidesCard(
                                        heading1: "Guest name",
                                        heading2: "pickup location",
                                        heading3: "Contact no",
                                        heading4: "Dropoff location",
                                        data1: e.user!.username!,
                                        data2: e.startLocation!,
                                        data3: e.user!.contact.toString(),
                                        data4: e.endLocation!,
                                      ))
                                  .toList()),
                        ],
                      ),
                    );
                  }
                } else {
                  return Center();
                }
              },
            ));
      } else {
        return SizedBox(
          height: 516,
          child: BlocConsumer<RentalHistoryCubit, RentalHistoryState>(
            listener: (context, state) {
              if (state is RentalHistoryError) {
                errorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is RentalHistoryError) {
                return errorIcon;
              } else if (state is RentalHistoryLoading) {
                return progressIndicator;
              } else if (state is RentalHistoryLoaded) {
                if (state.rentalRequest!.rentals!.isEmpty) {
                  return noAcceptedRequest;
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Room no ",
                          style: GoogleFonts.lato(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Column(
                            children: state.rentalRequest!.rentals!
                                .map((e) => ownerOngoingcards(
                                      contact: e.user!.contact!,
                                      user: e.user!.username!,
                                      imgLink: e.rental!.image!,
                                      name: e.rental!.name!,
                                      quantitiy: e.distance.toString(),
                                      total: "${e.rental!.price} /- per hour",
                                    ))
                                .toList()),
                      ],
                    ),
                  );
                }
              } else {
                return Center();
              }
            },
          ),
        );
      }
    });
  }
}
