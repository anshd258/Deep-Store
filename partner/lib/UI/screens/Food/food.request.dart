import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/ownerRequestCard.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/middleware/incoming_request_cubit.dart';

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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is IncomingRequestLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is IncomingRequestError) {
                return Center(
                  child: Icon(Icons.error_outline_outlined,
                      color: Colors.red.shade400, size: 100),
                );
              }
              if (state is IncomingRequestcomplete) {
                return SingleChildScrollView(
                  child: Column(
                    children: state.foodRequest!.orders!
                        .map(
                          (e) => OwnerRequestcard(),
                        )
                        .toList(),
                  ),
                );
              } else {
                return Center();
              }
            },
          )),
    );
  }
}
