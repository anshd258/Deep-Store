import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/widget/ridesCard.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_rental_request_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_ride_request_cubit.dart';

import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/middleware/AcceptedRequestCubit/filter_cubit_cubit.dart';

import '../widget/ownerOngoingcard.dart';

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
                              .map((e) => ownerOngoingcards(
                                    name: e.items!.first.name!,
                                    quantitiy:
                                        e.items!.first.quantity!.toString(),
                                    total: e.total!.toString(),
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
                          children: state.rideRequest!.rides!
                              .map((e) => ownerOngoingcards(
                                    name: e.startLocation!,
                                    quantitiy: e.distance.toString(),
                                    total: e.price!.toString(),
                                  ))
                              .toList()),
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
                        children: state.rentalRequest!.rentals!
                            .map((e) => RidesCard(
                                  dropLocation: e.startLocation!,
                                  pickupLocation: e.endLocation!,
                                ))
                            .toList()),
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
