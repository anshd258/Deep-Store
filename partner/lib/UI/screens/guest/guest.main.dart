import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/UI/screens/guest/avilableRoombody.dart';
import 'package:partner/UI/screens/guest/checkInRooms.dart';
import 'package:partner/UI/util/utilwidget.dart';

import 'package:partner/UI/widget/rides.tabe.dart';

import 'package:partner/middleware/guestcubits/available_rooms_cubit.dart';
import 'package:partner/middleware/guestcubits/checked_in_rooms_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';

List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class GuestMain extends StatefulWidget {
  const GuestMain({super.key});

  @override
  State<GuestMain> createState() => _GuestMainState();
}

class _GuestMainState extends State<GuestMain>
    with SingleTickerProviderStateMixin {
  int tabindex = 0;

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
                lable: 'Checked-in rooms',
              ),
              Tabes(
                currentIndex: tabindex,
                index: 1,
                lable: 'Available rooms',
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
          BlocConsumer<CheckedInRoomsCubit, CheckedInRoomsState>(
            listener: (context, state) {
              if (state is CheckedInRoomsError) {
                errorSnackBar(context, "state.message");
              }
            },
            builder: (context, state) {
              if (state is CheckedInRoomsLoading) {
                return progressIndicator;
              }
              if (state is CheckedInRoomsError) {
                return errorIcon;
              }
              if (state is CheckedInRoomsLoaded) {
                if (state.toString() == null) {
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
                  return CheckedInRooms();
                }
              } else {
                return const Center();
              }
            },
          ),
          BlocConsumer<AvailableRoomsCubit, AvailableRoomsState>(
            listener: (context, state) {
              if (state is AvailableRoomsError) {
                errorSnackBar(context, "state.message");
              }
            },
            builder: (context, state) {
              if (state is AvailableRoomsLoading) {
                return progressIndicator;
              }
              if (state is AvailableRoomsError) {
                return errorIcon;
              }
              if (state is AvailableRoomsLoaded) {
                if (state.toString() == null) {
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
                  return AvailableRooms();
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




