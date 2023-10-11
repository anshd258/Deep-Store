import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/widget/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/graedient.common.button.dart';
import 'package:partner/UI/widget/rentalCard.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';

class OwnerRequestcard extends StatefulWidget {
  RequestType type;
  String id;
  String heading1;
  String heading2;
  String heading3;
  String heading4;
  String data1;
  String data2;
  String data3;
  String data4;

  OwnerRequestcard(
      {super.key,
      required this.type,
      required this.id,
      required this.heading1,
      required this.data1,
      required this.heading2,
      required this.data2,
      required this.heading3,
      required this.data3,
      required this.heading4,
      required this.data4});

  @override
  State<OwnerRequestcard> createState() => _OwnerRequestcardState();
}

class _OwnerRequestcardState extends State<OwnerRequestcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
                blurStyle: BlurStyle.outer)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RidesDetailsContainer(
                heading: widget.heading1,
                data: widget.data1,
                fontSize: 16,
              ),
              RidesDetailsContainer(
                heading: widget.heading2,
                data: widget.data2,
                fontSize: 16,
              ),
              GradientCommonButton(
                  function: () {
                    if (widget.type == RequestType.food) {
                      context
                          .read<IncomingFoodRequestCubit>()
                          .acceptRequest(widget.id, "5345");
                    } else if (widget.type == RequestType.ride) {
                      print("calling rides api");
                      context
                          .read<IncomingRideRequestCubit>()
                          .acceptRequest(widget.id);
                    } else {
                      context
                          .read<IncomingRentalRequestCubit>()
                          .acceptRequest(widget.id);
                    }
                  },
                  height: 42,
                  margin: EdgeInsets.all(2),
                  borderradius: 4,
                  lable: "Accept",
                  width: 146)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RidesDetailsContainer(
                heading: widget.heading3,
                data: widget.data3,
                fontSize: 16,
              ),
              RidesDetailsContainer(
                heading: widget.heading4,
                data: widget.data4,
                fontSize: 16,
              ),
              OutlinedDeclineButton(
                  function: () {
                    if (widget.type == RequestType.food) {
                      context
                          .read<IncomingFoodRequestCubit>()
                          .rejectRequest(widget.id, "345");
                    } else if (widget.type == RequestType.ride) {
                      context
                          .read<IncomingRideRequestCubit>()
                          .rejectRequest(widget.id);
                    } else {
                      context
                          .read<IncomingRentalRequestCubit>()
                          .rejectRequest(widget.id);
                    }
                  },
                  color: Color(0xFFC25C5C),
                  height: 42,
                  margin: EdgeInsets.all(2),
                  borderradius: 4,
                  lable: "Decline",
                  width: 146)
            ],
          )
        ],
      ),
    );
  }
}
