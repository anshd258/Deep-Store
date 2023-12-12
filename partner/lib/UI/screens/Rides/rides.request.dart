import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';
import 'package:partner/UI/widget/rides.tabe.dart';
import 'package:partner/Constants/constants.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';
import 'package:partner/UI/util/utilwidget.dart';

class RidesRequest extends StatefulWidget {
  const RidesRequest({super.key});

  @override
  State<RidesRequest> createState() => _RidesRequestState();
}

class _RidesRequestState extends State<RidesRequest>
    with SingleTickerProviderStateMixin {
  int tabindex = 0;
  List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        tabindex = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 20),
          child: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            indicatorWeight: 0.001,
            tabs: [
              Tabes(
                currentIndex: tabindex,
                index: 0,
                lable: 'Rental Requests',
              ),
              Tabes(
                currentIndex: tabindex,
                index: 1,
                lable: 'Ride Requests',
              )
            ],
            onTap: (value) {
              setState(() {
                _controller.animateTo(tabindex = _controller.index);
              });
            },
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          BlocConsumer<IncomingRentalRequestCubit, IncomingRentalRequestState>(
            listener: (context, state) {
              if (state is IncomingRentalRequestError) {
                errorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is IncomingRentalRequestLoading) {
                return progressIndicator;
              }
              if (state is IncomingRentalRequestError) {
                return errorIcon;
              }
              if (state is IncomingRentalRequestCompleted) {
                if (state.rentalRequest!.rentals!.isEmpty) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return LiquidPullToRefresh(
                          onRefresh: () async {
                            context
                                .read<IncomingRentalRequestCubit>()
                                .getIncomingRequest();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: constraints.minHeight,
                                    maxHeight: constraints.maxHeight,
                                    minWidth: constraints.minWidth,
                                    maxWidth: constraints.maxWidth),
                                child: Center(
                                  child: noAcceptedRequest,
                                )),
                          ));
                    },
                  );
                } else {
                  return RentalRequest(
                    data: state,
                  );
                }
              } else {
                return const Center();
              }
            },
          ),
          BlocConsumer<IncomingRideRequestCubit, IncomingRideRequestState>(
            listener: (context, state) {
              if (state is IncomingRideRequestError) {
                errorSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is IncomingRideRequestLoading) {
                return progressIndicator;
              }
              if (state is IncomingRideRequestError) {
                return errorIcon;
              }
              if (state is IncomingRideRequestLoaded) {
                if (state.rideRequest!.rides!.isEmpty) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return LiquidPullToRefresh(
                          onRefresh: () async {
                            context
                                .read<IncomingRideRequestCubit>()
                                .getIncomingRequest();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: constraints.minHeight,
                                    maxHeight: constraints.maxHeight,
                                    minWidth: constraints.minWidth,
                                    maxWidth: constraints.maxWidth),
                                child: Center(
                                  child: noAcceptedRequest,
                                )),
                          ));
                    },
                  );
                } else {
                  return RideRequest(
                    data: state,
                  );
                }
              } else {
                return const Center();
              }
            },
          ),
        ],
      ),
    );
  }
}

class RentalRequest extends StatelessWidget {
 const  RentalRequest({super.key, required this.data});
final  IncomingRentalRequestCompleted data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: LiquidPullToRefresh(
        onRefresh: () async {
          context.read<IncomingRentalRequestCubit>().getIncomingRequest();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: data.rentalRequest!.rentals!
                .map((e) => OwnerRequestcard(
                      heading1: "Guest name",
                      heading2: "Room no",
                      heading3: "Order Name",
                      heading4: "Total Price",
                      data1: e.user!.username ?? "null",
                      data2: e.user!.room ?? "null",
                      data3: "${e.rental!.name} (x${e.rental!.quantity})",
                      data4: "₹ ${e.rental!.price}",
                      type: RequestType.rental,
                      id: e.id!.toString(),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class RideRequest extends StatelessWidget {
 const RideRequest({super.key, required this.data});
 final IncomingRideRequestLoaded data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: LiquidPullToRefresh(
        onRefresh: () async {
          context.read<IncomingRideRequestCubit>().getIncomingRequest();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: data.rideRequest!.rides!
                .map((e) => OwnerRequestcard(
                      heading1: "Guest name",
                      heading2: "Room no",
                      heading3: "Order name",
                      heading4: "Total Price",
                      data1: e.user!.username ?? "null",
                      data2: e.user!.room ?? "null",
                      data3: e.distance ?? "null",
                      data4: e.price ?? "null",
                      type: RequestType.ride,
                      id: e.id.toString(),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
