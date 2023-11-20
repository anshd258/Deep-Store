import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/helpers/models/food.request.dart';

Future<dynamic> IteamDisplayDialog(BuildContext context, Orders e,
    VoidCallback declineFunction, VoidCallback acceptFunction) {
  return showDialog(
    barrierLabel: "cancle",
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 5,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: SizedBox(
          height: 200,
          width: 300,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...e.items!.map((e) {
                  if (e.quantity == 0) {
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
                SizedBox(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                              lable: "Cancel request",
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
                                lable: "Mark complete",
                                width: 135),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
        ),
      );
    },
  );
}
