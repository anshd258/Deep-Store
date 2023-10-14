import 'package:flutter/material.dart';
import 'package:partner/Constants/SizesEnum.dart';
import 'package:partner/Constants/componentsEnum.dart';
import 'package:partner/UI/util/textwidget.dart';

import '../../../Constants/PotraitSizes.dart';

class ownerOngoingcards extends StatelessWidget {
  String name;
  String quantitiy;
  String total;
  String? imgLink;
  String user;
  String contact;
  ownerOngoingcards(
      {super.key,
      required this.imgLink,
      required this.name,
      required this.quantitiy,
      required this.total,
      required this.contact,
      required this.user});

  @override
  Widget build(BuildContext context) {
    imgLink ??= "https://st.depositphotos.com/1016929/2741/i/600/depositphotos_27413021-stock-photo-sport-bike-enduro.jpg";
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
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Image.network(
            imgLink!,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizesMapPotrait[Component
                        .ownerOngoingcardsIMAGE]![Sizes.MARGINHORIZONTAL]!),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: child,
                ),
              );
            },
            height: sizesMapPotrait[Component.ownerOngoingcardsIMAGE]
                ?[Sizes.HEIGHT],
            width: sizesMapPotrait[Component.ownerOngoingcardsIMAGE]
                ?[Sizes.WIDTH],
            fit: BoxFit.fill,
          ),
          Container(
            height: sizesMapPotrait[Component.ownerOngoingcardsDESC]
                ?[Sizes.HEIGHT],
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textwidget("$name ", "(x$quantitiy)", 16, FontWeight.w600),
                textwidget("Name : ", user, 14, FontWeight.w400),
                textwidget("Ph no :", contact, 14, FontWeight.w400),
                textwidget("Total : ", "₹$total", 14, FontWeight.w400),
              ],
            ),
          )
        ],
      ),
    );
  }
}
