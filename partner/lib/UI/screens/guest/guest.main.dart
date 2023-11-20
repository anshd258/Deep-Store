import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/UI/widget/rides.tabe.dart';
import 'package:partner/UI/widget/tiles/checkintiles.dart';
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

class CheckedInRooms extends StatelessWidget {
  CheckedInRooms({
    super.key,
  });

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
            children: val
                .map((e) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/CheckInGuestDetails");
                      },
                      child: CheckedInTiles(
                        bill: "3,124",
                        name: "Alice lee",
                        room_no: "103",
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class AvailableRooms extends StatelessWidget {
  AvailableRooms({
    super.key,
  });

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
            children: val.map((e) {
              var s = "103";
              var standerd = 'Standard room';
              var src =
                  "https://imgs.search.brave.com/0FHO0363glxmwRe5Pwe2n9IrUcBKf9ri5MzIiAazCuM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by9pbnRlcmlvci1z/cGFjZS1iaWctYmVk/LXJvb20tbHV4dXJ5/LWhvdGVsXzExMTIt/NzEzMS5qcGc_c2l6/ZT02MjYmZXh0PWpw/Zw";
              var function2 = () {};
              return AvailableRoomTiiles(
                  src: src, s: s, standerd: standerd, function2: function2);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class AvailableRoomTiiles extends StatelessWidget {
  const AvailableRoomTiiles({
    super.key,
    required this.src,
    required this.s,
    required this.standerd,
    required this.function2,
  });

  final String src;
  final String s;
  final String standerd;
  final Null Function() function2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: LayoutBuilder(builder: (context, constrain) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      src,
                      width: constrain.maxWidth - 10,
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Room ${s}",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text("${standerd}",
                              style: GoogleFonts.lato(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      GradientCommonButton(
                          function: function2,
                          height: 40,
                          margin: EdgeInsets.all(0),
                          borderradius: 8,
                          lable: "Check-In guest",
                          width: 150)
                    ],
                  ))
            ]);
      }),
    );
  }
}
