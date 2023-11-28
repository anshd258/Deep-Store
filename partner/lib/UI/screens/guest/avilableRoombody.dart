import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/UI/screens/guest/guest.main.dart';
import 'package:partner/UI/widget/tiles/avaliableRoomTiles.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';

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



