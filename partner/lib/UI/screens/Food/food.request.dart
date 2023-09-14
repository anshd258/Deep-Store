import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/UI/util/utilwidget.dart';

class FoodRequest extends StatefulWidget {
  FoodRequest({super.key});

  @override
  State<FoodRequest> createState() => _FoodRequestState();
}

class _FoodRequestState extends State<FoodRequest> {
  List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Text(
            'Food Requests',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Color(0xFF565656),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.28,
            ),
          ),
        ),
      ),
      body: SizedBox(
          height: double.infinity,
          child: BlocConsumer<IncomingFoodRequestCubit, IncomingRequestState>(
            listener: (context, state) {
              if (state is IncomingRequestError) {
                errorSnackBar(context, state.message);
              }
            },
            buildWhen: (previous, current) {
              if (previous is IncomingRequestcomplete &&
                  current is IncomingRequestError) {
                return false;
              } else {
                return true;
              }
            },
            builder: (context, state) {
              if (state is IncomingRequestLoading) {
                return progressIndicator;
              }
              if (state is IncomingRequestError) {
                return errorIcon;
              }
              if (state is IncomingRequestcomplete) {
                if (state.foodRequest.orders!.isEmpty) {
                  return noIncomingRequest;
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: state.foodRequest.orders!
                          .map(
                            (e) => OwnerRequestcard(
                                type: RequestType.food, id: e.id!.toString()),
                          )
                          .toList(),
                    ),
                  );
                }
              } else {
                return Center();
              }
            },
          )),
    );
  }
}
