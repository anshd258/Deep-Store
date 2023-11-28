import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/screens/guest/checkInGuestDetails.dart';

class OrderSummeryWidget extends StatelessWidget {
  const OrderSummeryWidget({
    super.key,
    required this.iconType,
    required this.e
  });
  final orders e;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        controlAffinity: ListTileControlAffinity.trailing,
        leading: Icon(iconType, color: Colors.green, size: 30),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              e.type!,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              "₹${e.total}",
              style: GoogleFonts.lato(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
        subtitle: Text(
          "(${e.qty} orders)",
          style: GoogleFonts.lato(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Items List",
                    style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                Text("₹ Price",
                    style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          ...e.items!.map((e) {
            if (e.quantity == 0) {
              return Center();
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${e.name} (X${e.quantity})",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                    Text("₹${e.listedPrice}",
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              );
            }
          }).toList(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text("₹${e.total}",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ]);
  }
}