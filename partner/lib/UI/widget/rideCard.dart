import 'package:flutter/material.dart';
import 'package:partner/Constants/SizesEnum.dart';
import 'package:partner/Constants/componentsEnum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/util/textwidget.dart';

import '../../../Constants/PotraitSizes.dart';

class ownerOngoingcards extends StatelessWidget {
  String name;
  String quantitiy;
  String total;
  String user;
  String contact;
  ownerOngoingcards(
      {super.key,
      required this.name,
      required this.quantitiy,
      required this.total,
      required this.contact,
      required this.user});

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
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizesMapPotrait[Component
                        .ownerOngoingcardsIMAGE]![Sizes.MARGINHORIZONTAL]!),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
            width: sizesMapPotrait[Component.ownerOngoingcardsDESC]
                ?[Sizes.WIDTH],
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textwidget("${name} ", "(x${quantitiy})", 16, FontWeight.w600),
                textwidget("Name : ", user, 14, FontWeight.w400),
                textwidget("Ph no :", contact, 14, FontWeight.w400),
                textwidget("Total : ", "₹${total}", 14, FontWeight.w400),
              ],
            ),
          )
        ],
      ),
    );
  }
}
