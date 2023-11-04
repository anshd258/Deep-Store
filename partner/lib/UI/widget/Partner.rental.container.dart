import 'package:flutter/material.dart';
import 'package:partner/UI/util/textwidget.dart';
import 'package:partner/UI/widget/Aleartdialog/partner.rental.remove.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';

class PartnerRentalContainer extends StatelessWidget {
  const PartnerRentalContainer({super.key});
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
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.network(
                "https://media.wired.co.uk/photos/63e15d1d8867ad9df8cc4ef2/master/w_1600,c_limit/Rolls-Royce-Spectre-EV-First-Drive-2-Gear.jpg",
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: child,
                    ),
                  );
                },
                height: 120,
                width: 146,
                fit: BoxFit.fill,
              ),
              Container(
                height: 130,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget("", "Joginder singh", 16, FontWeight.w400),
                    textwidget("", "+91 8686845848", 14, FontWeight.w400),
                    textwidget("", "KLPQ726389JED", 16, FontWeight.w400),
                    textwidget("", "LA 01 B 2013", 16, FontWeight.w400),
                  ],
                ),
              )
            ],
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
          )
        ],
      ),
    );
  }
}
