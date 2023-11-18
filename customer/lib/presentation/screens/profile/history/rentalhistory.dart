// ignore_for_file: unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:customer/data/models/rentalrequest.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../middleware/blocs/rental/rental_cubit.dart';
import '../../../widgets/squicircle.dart';

class RentalHistoryCard extends StatelessWidget {
  const RentalHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<RentalCubit>().state.rentalRequestList == null) {
        context.read<RentalCubit>().fetchAllRentalRequests();
      }
    });
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<RentalCubit>().fetchAllRentalRequests();
      },
      child: BlocBuilder<RentalCubit, RentalState>(
        builder: (context, rentalstate) {
          List<RentalRequest>? data = rentalstate.rentalRequestList == null
              ? null
              : rentalstate.rentalRequestList!.reversed.toList();
          return SizedBox(
            child: data != null
                ? data.isEmpty
                    ? const Center(
                        child: Text('no rentals booked yet'),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          bool showDate = false;
                          if (index == 0) {
                            showDate = true;
                          } else {
                            if (DateFormat('dd/MM/yy').format(
                                    data[index - 1].startTime ??
                                        DateTime.now()) !=
                                DateFormat('dd/MM/yy').format(
                                    data[index].startTime ?? DateTime.now())) {
                              showDate = true;
                            }
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (showDate)
                                Builder(builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    child: Text(
                                        ' ${DateFormat('dd/MM/yy').format(data[index].startTime ?? DateTime.now())}'),
                                  );
                                }),
                              Card(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SquicircleContainer(
                                          width: constraints.maxWidth * 0.35,
                                          height: constraints.maxWidth * 0.35,
                                          child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder: (context,
                                                      url, downloadProgress) =>
                                                  Center(
                                                      child: CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress)),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                              imageUrl: data[index]
                                                      .rental
                                                      .image ??
                                                  "https://dummyimage.com/300"),
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                textwidget(
                                                    ' ${data[index].rental.name}',
                                                    "",
                                                    17,
                                                    FontWeight.w600),
                                                textwidget(
                                                    "Nos     :   ",
                                                    "${data[index].rental.quantity}",
                                                    16,
                                                    FontWeight.w400),
                                                textwidget(
                                                    "Total   :   ",
                                                    'Rs.  ${data[index].rental.price * data[index].rental.quantity}/day',
                                                    16,
                                                    FontWeight.w400),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ],
                          );
                        },
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
