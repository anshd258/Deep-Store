// ignore_for_file: unnecessary_string_interpolations

import 'package:customer/data/models/rentalrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/blocs/rental/rental_cubit.dart';
import '../../widgets/squicircle.dart';

class RentalHistory extends StatelessWidget {
  const RentalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // context.read<FoodCubit>().fetchFoodOrders();
      context.read<RentalCubit>().fetchAllRentalRequests();
      // context.read<RideCubit>().fetchRideRequests();
    });
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<RentalCubit>().fetchAllRentalRequests();
      },
      child: BlocBuilder<RentalCubit, RentalState>(
        builder: (context, rentalstate) {
          List<RentalRequest>? data = rentalstate.rentalRequestList;
          return SizedBox(
            child: data != null
                ? data.isEmpty
                    ? const Center(
                        child: Text('no rentals booked yet'),
                      )
                    : ListView(
                        children: data.map((request) {
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            margin: const EdgeInsets.all(18),
                            child: Container(
                              height: 120,
                              margin: const EdgeInsets.all(12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SquicircleContainer(
                                      height: double.infinity,
                                      child: Image.network(
                                        "https://dummyimage.com/300",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        textwidget('Yamaha FZS-FI', "", 16,
                                            FontWeight.w600),
                                        textwidget(
                                            "Nos : ",
                                            "${request.rentalId}",
                                            14,
                                            FontWeight.w400),
                                        textwidget("Total : ", "₹ 1500/ day",
                                            14, FontWeight.w400),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              width: 2,
                                              color: const Color.fromRGBO(
                                                  73, 204, 115, 1))),
                                      child: Text(
                                        request.status.name,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(73, 204, 115, 1),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }

  Row textwidget(
      String text1, String text2, double fontSize, FontWeight fontWeight) {
    return Row(
      children: [
        Text(text1,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.w600)),
        Text(text2,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: fontWeight))
      ],
    );
  }
}
