import 'package:flutter/material.dart';
import 'package:partner/helpers/models/food.request.dart';

Future<dynamic> IteamDisplayDialog(BuildContext context, Orders e) {
  return showDialog(
    barrierLabel: "cancle",
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 5,
        content: SizedBox(
          height: 200,
          width: 300,
          child: Column(
              children: e.items!.map((e) {
            if (e.quantity == 0) {
              return Center();
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${e.name} (X${e.quantity})"),
                    Text("₹${e.listedPrice}"),
                  ],
                ),
              );
            }
          }).toList()),
        ),
      );
    },
  );
}
