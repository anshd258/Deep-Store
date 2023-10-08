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
                    : ListView(
                      reverse: true,
                        children: data.map((ride) {
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 9),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 12, bottom: 20),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Row(
                                        children: [
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
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RidesDetailsContainer(
                                                data: ride.distance.toString(),
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
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                width: 2,
                                                color: const Color.fromRGBO(
                                                    73, 204, 115, 1))),
                                        child: Text(
                                          ride.status.name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  73, 204, 115, 1),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    )
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
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              data,
              style: GoogleFonts.lato(
                color: const Color(0xFF555555),
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
