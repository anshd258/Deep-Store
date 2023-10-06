import 'package:customer/data/models/foodorder.dart';
import 'package:customer/data/models/rentalrequest.dart';
import 'package:customer/data/models/ride.dart';
import 'package:customer/middleware/blocs/foodcubit/food_cubit.dart';
import 'package:customer/middleware/blocs/rentalcubit/rental_cubit.dart';
import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:customer/presentation/screens/orders/foodhistory.dart';
import 'package:customer/presentation/screens/orders/rentalhistory.dart';
import 'package:customer/presentation/screens/orders/ridehistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/blocs/filtercubit/filter_cubit.dart';
import '../../../middleware/helpers/constants.dart';
import '../../widgets/buttons/optionbuttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FoodCubit>().fetchFoodOrders();
      context.read<RentalCubit>().fetchAllRentalRequests();
        context.read<RideCubit>().fetchRideRequests();
    });
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Text(
                  "Ongoing requests",
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    BlocBuilder<FilterCubit, FilterState>(
                      builder: (context, state) {
                        return Container(
                          height: 33,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: FilterValue.values.map((e) {
                              return OptionsButton(
                                e: e,
                                selectede: state.SelectedValue,
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Builder(builder: (context) {
            return BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }

                if (state.SelectedValue == FilterValue.RENTALS) {
                  return BlocBuilder<RentalCubit, RentalState>(
                    builder: (context, rentalstate) {
                      List<RentalRequest>? data = rentalstate.rentalRequestList;
                      return SizedBox(
                        child: data != null
                            ? data.isEmpty
                                ? const Center(
                                    child: Text('no rentals booked yet'),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      children: data.map((e) {
                                        return RentalHistory(
                                          request: e,
                                        );
                                      }).toList(),
                                    ),
                                  )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      );
                    },
                  );
                }
                if (state.SelectedValue == FilterValue.RIDES) {
                  return BlocBuilder<RideCubit, RideState>(
                    builder: (context, ridestate) {
                      List<Ride>? data = ridestate.rideRequests;
                      return SizedBox(
                        child: data != null
                            ? data.isEmpty
                                ? const Center(
                                    child: Text('no rides booked'),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      children: data.map((e) {
                                        return RidesCard(
                                            contactNo: '9415789546',
                                            dropOffLocation:
                                                e.dropOffLocation ?? '',
                                            name: 'Shubho',
                                            pickUpLocation:
                                                e.pickUpLocation ?? '');
                                      }).toList(),
                                    ),
                                  )
                            : const Center(child: CircularProgressIndicator()),
                      );
                    },
                  );
                } else {
                  return BlocBuilder<FoodCubit, FoodState>(
                    builder: (context, foodstate) {
                      List<FoodOrder>? data = foodstate.foodOrderList;
                      return data != null
                          ? SizedBox(
                              child: data.isEmpty
                                  ? const Center(
                                      child: Text('no order yet'),
                                    )
                                  : SingleChildScrollView(
                                      child: Column(
                                        children: data.map((e) {
                                          return FoodHistory(
                                            order: e,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  );
                }
              },
            );
          }),
        )
      ],
    );
  }
}
