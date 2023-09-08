import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';
import 'package:partner/UI/widget/rides.tabe.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/middleware/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incoming_request_cubit.dart';

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
          RentalRequest(
              val: StatusRideRental.pending, body: RequestType.rental),
          RentalRequest(val: StatusRideRental.pending, body: RequestType.ride),
        ],
      ),
    );
  }
}

class RentalRequest extends StatelessWidget {
  const RentalRequest({
    super.key,
    required this.val,
    required this.body,
  });

  final StatusRideRental val;
  final RequestType body;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IncomingRentalRequestCubit, IncomingRentalRequestState>(
      listener: (context, state) {
        if (state is IncomingRentalRequestError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is IncomingRentalRequestLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is IncomingRentalRequestError) {
          return Center(
            child: Icon(Icons.error_outline_outlined,
                color: Colors.red.shade400, size: 100),
          );
        }
        if (state is IncomingRentalRequestCompleted) {
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: state.rentalRequest!.rentals!
                    .map((e) => OwnerRequestcard())
                    .toList(),
              ),
            ),
          );
        } else {
          return Center();
        }
      },
    );
  }
}
