import 'package:flutter/material.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/util/textwidget.dart';
import 'package:partner/UI/widget/Aleartdialog/partner.rental.remove.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';

class PartnerRentalContainer extends StatelessWidget {
  final Services? tab;
  final String title1;
  final String url;
  final String title2;
  final String? title3;
  final bool? day;
  const PartnerRentalContainer(
      {super.key,
      this.tab,
      required this.url,
      required this.title1,
      required this.title2,
      this.day,
      this.title3});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
                blurStyle: BlurStyle.outer)
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: AspectRatio(
        aspectRatio: 2.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Image.network(
                    url,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          child: child,
                        ),
                      );
                    },
                    width: 146,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textwidget("", title1, 16, FontWeight.w400),
                        textwidget("", title2, 14, FontWeight.w400),
                        if (tab != null &&
                            tab == Services.HOUSEKEEPING &&
                            day != null) ...[
                          Icon(
                            day! ? Icons.sunny : Icons.nightlight_round,
                            color: const Color.fromARGB(255, 250, 239, 34),
                            size: 20,
                          ),
                        ] else if (tab != null &&
                            tab == Services.LAUNDERY &&
                            title3 != null) ...[
                          textwidget("", title3!, 14, FontWeight.w400),
                        ] else ...[
                          Row(
                            children: [
                              const Icon(
                                Icons.sunny,
                                color: Color.fromARGB(255, 250, 239, 34),
                                size: 20,
                              ),
                              textwidget(" ", "/ ", 25, FontWeight.w400),
                              const Icon(
                                Icons.nights_stay,
                                color: Color.fromARGB(255, 101, 54, 244),
                                size: 20,
                              ),
                            ],
                          ),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedDeclineButton(
                      color: Colors.redAccent.shade400,
                      function: () {
                        String name = "Joginder Singh";
                        rentalRemovalDialog(context, name);
                      },
                      height: 34,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      borderradius: 5,
                      lable: "Remove",
                      width: 146),
                  GradientCommonButton(
                      function: () {
                        Navigator.pushNamed(context, "/partner/rental/edit");
                      },
                      height: 34,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      borderradius: 5,
                      lable: "Edit",
                      width: 146)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
