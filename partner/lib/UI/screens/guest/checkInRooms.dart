import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/UI/screens/guest/guest.main.dart';
import 'package:partner/UI/widget/tiles/checkintiles.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';

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