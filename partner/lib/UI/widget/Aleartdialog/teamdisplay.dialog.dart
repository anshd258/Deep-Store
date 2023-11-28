import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/helpers/models/food.request.dart';

Future<dynamic> IteamDisplayDialog(
    {required BuildContext context,
    Orders? e,
    String? heading,
    String? subHeading,
    required VoidCallback declineFunction,
    required VoidCallback acceptFunction,
    required String declineTitle,
    required String acceptTitle}) {
  return showDialog(
    barrierLabel: "cancle",
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.all(15),
        actionsPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        titlePadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        title: heading == null
            ? null
            : Text(heading,
                style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
        elevation: 5,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: SizedBox(
          height: e != null ? 200 : 55,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      if (e != null) ...[
                        ...e.items!.map((e) {
                          if (e.quantity == "") {
                            return Center();
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${e.name} (X${e.quantity})",
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Text("₹${e.listedPrice}",
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            );
                          }
                        }).toList(),
                      ],
                    ],
                  ),
                ),
                if (subHeading != null) ...[
                  Text(subHeading,
                      style: GoogleFonts.lato(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ],
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (e != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text("₹${e.total}",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ],
                ),
              ]),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: OutlinedDeclineButton(
                  color: Colors.red,
                  function: declineFunction,
                  height: 45,
                  margin: EdgeInsets.all(0),
                  borderradius: 8,
                  lable: declineTitle,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 10,
                child: GradientCommonButton(
                    function: acceptFunction,
                    height: 45,
                    margin: EdgeInsets.all(0),
                    borderradius: 8,
                    lable: acceptTitle,
                    width: 135),
              ),
            ],
          ),
        ],
      );
    },
  );
}
