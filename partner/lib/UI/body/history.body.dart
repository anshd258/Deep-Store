import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/ownerOngoingcard.dart';
import 'package:partner/UI/widget/ridesCard.dart';
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
            height: 538,
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
                              .map((e) => ownerOngoingcards())
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
                          children: state.rideRequest!.rides!
                              .map((e) => RidesCard())
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
                        children: state.rentalRequest!.rentals!
                            .map((e) => RidesCard())
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
