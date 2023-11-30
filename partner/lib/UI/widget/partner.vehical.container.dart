import 'package:flutter/material.dart';
import 'package:partner/UI/util/textwidget.dart';
import 'package:partner/UI/widget/Aleartdialog/partner.rental.remove.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';

class PartnerVehicalContainer extends StatelessWidget {
  const PartnerVehicalContainer({super.key});

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
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: AspectRatio(
        aspectRatio: 1.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      "https://media.wired.co.uk/photos/63e15d1d8867ad9df8cc4ef2/master/w_1600,c_limit/Rolls-Royce-Spectre-EV-First-Drive-2-Gear.jpg",
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textwidget(
                              "", "Honda Activa 6G", 16, FontWeight.w400),
                          textwidget("", "110cc engine", 14, FontWeight.w400),
                          textwidget("", "5 ltr / 47kmpl", 16, FontWeight.w400),
                          textwidget("", "550/day", 16, FontWeight.w400),
                        ],
                      ),
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
                      function: () {},
                      height: 34,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      borderradius: 5,
                      lable: "Hide",
                      width: 146)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
