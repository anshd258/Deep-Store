import 'package:customer/data/models/foodorder.dart';
import 'package:customer/data/models/rentalrequest.dart';
import 'package:customer/data/models/ride.dart';
import 'package:customer/middleware/blocs/food/food_bloc.dart';
import 'package:customer/middleware/blocs/rental/rental_bloc.dart';
import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:customer/presentation/screens/orders/foodhistory.dart';
import 'package:customer/presentation/screens/orders/rentalhistory.dart';
import 'package:customer/presentation/screens/orders/ridehistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/rental.dart';
import '../../../middleware/blocs/filtercubit/filter_cubit.dart';
import '../../../middleware/helpers/constants.dart';
import '../../widgets/optionbuttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<FoodBloc>().add(FetchFoodOrders());
        context.read<RentalBloc>().add(FetchRentalRequests());
        context.read<RideBloc>().add(FetchRideRequests());
      },
      child: Column(
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
                    return BlocBuilder<RentalBloc, RentalState>(
                      builder: (context, rentalstate) {
                        List<RentalRequest> data =
                            rentalstate.rentalRequestList ?? [];
                        return SizedBox(
                          child: data.isEmpty
                              ? const Center(
                                  child: Text('no rentals booked yet'),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    children: data.map((e) {
                                      return const RentalHistory();
                                    }).toList(),
                                  ),
                                ),
                        );
                      },
                    );
                  }
                  if (state.SelectedValue == FilterValue.RIDES) {
                    return BlocBuilder<RideBloc, RideState>(
                      builder: (context, ridestate) {
                        List<Ride> data = ridestate.rideRequests ?? [];
                        return SizedBox(
                          child: data.isEmpty
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
                                ),
                        );
                      },
                    );
                  } else {
                    return BlocBuilder<FoodBloc, FoodState>(
                      builder: (context, foodstate) {
                        List<FoodOrder> data = foodstate.foodOrderList ?? [];
                        return SizedBox(
                          child: data.isEmpty
                              ? const Center(
                                  child: Text('no order yet'),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    children: data.map((e) {
                                      return const FoodHistory();
                                    }).toList(),
                                  ),
                                ),
                        );
                      },
                    );
                  }
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
