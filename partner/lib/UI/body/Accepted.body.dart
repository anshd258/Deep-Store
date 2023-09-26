import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/rentalCard.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_rental_request_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_ride_request_cubit.dart';

import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/middleware/AcceptedRequestCubit/filter_cubit_cubit.dart';

import '../widget/rideCard.dart';

class RidesBody extends StatefulWidget {
  const RidesBody({super.key});

  @override
  State<RidesBody> createState() => _RidesBodyState();
}

class _RidesBodyState extends State<RidesBody> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var value = context.watch<FilterCubitCubit>();
      if (value.tabIndex == 1) {
        return SizedBox(
            height: 538,
            child: BlocConsumer<AcceptedRequestsCubit, AcceptedRequestsState>(
              listener: (context, state) {
                if (state is AcceptedRequestsError) {
                  errorSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is AcceptedRequestsError) {
                  return errorIcon;
                } else if (state is AcceptedRequestsLoading) {
                  return progressIndicator;
                } else if (state is AcceptedRequestsLoaded) {
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
                                                    content: Column(
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
            height: 538,
            child: BlocConsumer<AcceptedRideRequestCubit,
                AcceptedRideRequestState>(
              listener: (context, state) {
                if (state is AcceptedRideRequestError) {
                  errorSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is AcceptedRideRequestError) {
                  return errorIcon;
                } else if (state is AcceptedRideRequestLoading) {
                  return progressIndicator;
                } else if (state is AcceptedRideRequestLoaded) {
                  if (state.rideRequest!.rides!.isEmpty) {
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
                                  .map((e) => ownerOngoingcards(
                                        contact: e.user!.contact!,
                                        user: e.user!.contact!,
                                        name: e.startLocation!,
                                        quantitiy: e.distance.toString(),
                                        total: e.price!.toString(),
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
          height: 538,
          child: BlocConsumer<AcceptedRentalRequestCubit,
              AcceptedRentalRequestState>(
            listener: (context, state) {
              if (state is AcceptedRentalRequestError) {
                errorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is AcceptedRentalRequestError) {
                return errorIcon;
              } else if (state is AcceptedRentalRequestLoading) {
                return progressIndicator;
              } else if (state is AcceptedRentalRequestLoaded) {
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
          ),
        );
      }
    });
  }
}
