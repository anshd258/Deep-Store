// ignore_for_file: unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer/data/models/rentalrequest.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../middleware/blocs/rental/rental_cubit.dart';
import '../../../widgets/squicircle.dart';


class RentalHistoryCard extends StatelessWidget {
  const RentalHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(context.read<RentalCubit>().state.rentalRequestList == null)
      context.read<RentalCubit>().fetchAllRentalRequests();
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
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            shape: SmoothRectangleBorder(
                                borderRadius:
                                    SmoothBorderRadius(cornerRadius: 10)),
                            child: Container(
                              height: 120,
                              margin: const EdgeInsets.all(12),
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SquicircleContainer(
                                      width: constraints.maxWidth * 0.35,
                                      height: constraints.maxWidth * 0.35,
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress)),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          imageUrl: request.rental.image ??
                                              "https://dummyimage.com/300"),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          textwidget(' ${request.rental.name}',
                                              "", 17, FontWeight.w600),
                                          textwidget(
                                              "Nos : ",
                                              "${request.rental.quantity}",
                                              16,
                                              FontWeight.w400),
                                          textwidget(
                                              "Total : ",
                                              '${request.rental.price * request.rental.quantity}',
                                              16,
                                              FontWeight.w400),
                                        ],
                                      ),
                                    ),
                                    Builder(builder: (context) {
                                      Color color =
                                          const Color.fromRGBO(73, 204, 115, 1);
                                      if (request.status ==
                                          RequestStatus.rejected) {
                                        color = Colors.red;
                                      }
                                      return Container(
                                        padding: const EdgeInsets.all(4),
                                        margin: const EdgeInsets.all(4),
                                        height: 26,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                width: 1.5, color: color)),
                                        child: Center(
                                          child: Text(
                                            request.status.name,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: color,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      );
                                    })
                                  ],
                                );
                              }),
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

  Container textwidget(
      String text1, String text2, double fontSize, FontWeight fontWeight) {
    return Container(
      height: 20,
      child: Row(
        children: [
          Text(text1,
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontWeight: fontWeight)),
          Text(text2,
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontWeight: fontWeight))
        ],
      ),
    );
  }
}
