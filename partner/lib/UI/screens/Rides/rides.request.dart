import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';
import 'package:partner/UI/widget/rides.tabe.dart';
import 'package:partner/helpers/constants.dart';
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
          preferredSize: Size(double.infinity, 20),
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
                  return noIncomingRequest;
                } else {
                  return RentalRequest(
                    data: state,
                  );
                }
              } else {
                return Center();
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
                  return noIncomingRequest;
                }else{
                   return RideRequest(
                  data: state,
                );

                }
               
              } else {
                return Center();
              }
            },
          ),
        ],
      ),
    );
  }
}

class RentalRequest extends StatelessWidget {
  RentalRequest({super.key, required this.data});
  IncomingRentalRequestCompleted data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: data.rentalRequest!.rentals!
              .map((e) => OwnerRequestcard(type: RequestType.rental,id: e.id!.toString(),))
              .toList(),
        ),
      ),
    );
  }
}

class RideRequest extends StatelessWidget {
  RideRequest({super.key, required this.data});
  IncomingRideRequestLoaded data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children:
              data.rideRequest!.rides!.map((e) => OwnerRequestcard(type: RequestType.ride,id: e.id!.toString(),)).toList(),
        ),
      ),
    );
  }
}
