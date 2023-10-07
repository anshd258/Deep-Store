import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/ride.dart';

class RidesHistory extends StatelessWidget {
  const RidesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RideCubit>().fetchRideRequests();
    });
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<RideCubit>().fetchRideRequests();
      },
      child: BlocBuilder<RideCubit, RideState>(
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
                          children: data.map((ride) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.all(18),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 12, bottom: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: RidesDetailsContainer(
                                          data: ride.pickUpLocation ?? '',
                                          heading: "Pickup location",
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: RidesDetailsContainer(
                                          data: ride.dropOffLocation ?? '',
                                          heading: "Drop off location",
                                          fontSize: 16,
                                        ),
                                      )
                                    ]),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class RidesDetailsContainer extends StatelessWidget {
  String heading;
  String data;
  double fontSize;
  RidesDetailsContainer(
      {super.key,
      required this.heading,
      required this.data,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: Text(
              heading,
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 1),
            child: Text(
              data,
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
