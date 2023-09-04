import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../middleware/helpers/PotraitSizes.dart';
import '../../../middleware/helpers/SizesEnum.dart';
import '../../../middleware/helpers/constants.dart';


class RentalHistory extends StatelessWidget {
  const RentalHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizesMapPotrait[Component.ownerOngoingcards]?[Sizes.HEIGHT],
      margin: EdgeInsets.symmetric(
          vertical: sizesMapPotrait[Component.ownerOngoingcards]![
              Sizes.MARGINVERTICAL]!),
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
                textwidget("Ice-cream ", "(x3)", 16, FontWeight.w600),
                textwidget("Name : ", "Alice", 14, FontWeight.w400),
                textwidget("Ph no :", "+91 8764562372", 14, FontWeight.w400),
                textwidget("Total : ", "₹1000", 14, FontWeight.w400),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row textwidget(
      String text1, String text2, double fontSize, FontWeight fontWeight) {
    return Row(
      children: [
        Text(text1,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.w600)),
        Text(text2,
            style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: fontWeight))
      ],
    );
  }
}
