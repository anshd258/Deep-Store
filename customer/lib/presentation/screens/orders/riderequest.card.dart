import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/ride.dart';

class RidesRequestCard extends StatelessWidget {
  const RidesRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(context.read<RideCubit>().state.rideRequests == null)
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
                    : ListView(
                        children: data.reversed.map((ride) {
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            shape: SmoothRectangleBorder(
                                borderRadius:
                                    SmoothBorderRadius(cornerRadius: 10)),
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RidesDetailsContainer(
                                                  data:
                                                      ride.distance.toString(),
                                                  heading: "Distance",
                                                  fontSize: 18,
                                                ),
                                                RidesDetailsContainer(
                                                  data: ride.price.toString(),
                                                  heading: "Price",
                                                  fontSize: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RidesDetailsContainer(
                                                data: ride.pickUpLocation ?? '',
                                                heading: "Pickup location",
                                                fontSize: 18,
                                              ),
                                              RidesDetailsContainer(
                                                data:
                                                    ride.dropOffLocation ?? '',
                                                heading: "Drop off location",
                                                fontSize: 18,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(builder: (context) {
                                      Color color =
                                          const Color.fromRGBO(73, 204, 115, 1);
                                      if (ride.status ==
                                          RequestStatus.rejected) {
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
                                          child: Text(
                                            ride.status.name,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: color,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      );
                                    })
                                  ]),
                            ),
                          );
                        }).toList(),
                      )
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class RidesDetailsContainer extends StatelessWidget {
  final String heading;
  final String data;
  final double fontSize;
  const RidesDetailsContainer(
      {super.key,
      required this.heading,
      required this.data,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              softWrap: true,
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              data,
              softWrap: true,
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
