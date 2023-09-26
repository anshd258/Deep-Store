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
  OwnerRequestcard({super.key, required this.type, required this.id});

  @override
  State<OwnerRequestcard> createState() => _OwnerRequestcardState();
}

class _OwnerRequestcardState extends State<OwnerRequestcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RidesDetailsContainer(
                heading: 'Guest name',
                data: 'Alice lee',
                fontSize: 16,
              ),
              RidesDetailsContainer(
                heading: 'Room no',
                data: '403',
                fontSize: 16,
              ),
              GradientCommonButton(
                  function: () {
                    if (widget.type == RequestType.food) {
                      context
                          .read<IncomingFoodRequestCubit>()
                          .acceptRequest(widget.id);
                    } else if (widget.type == RequestType.ride) {
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
                  width: 158)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RidesDetailsContainer(
                heading: 'Order name',
                data: 'Ice-cream (x 2)',
                fontSize: 16,
              ),
              RidesDetailsContainer(
                heading: 'Total Price',
                data: '170',
                fontSize: 16,
              ),
              OutlinedDeclineButton(
                  function: () {
                    if (widget.type == RequestType.food) {
                      context
                          .read<IncomingFoodRequestCubit>()
                          .rejectRequest(widget.id);
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
                  width: 158)
            ],
          )
        ],
      ),
    );
  }
}
