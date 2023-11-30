import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckedInTiles extends StatelessWidget {
  String name;
  String bill;
  String room_no;
  CheckedInTiles(
      {super.key,
      required this.bill,
      required this.name,
      required this.room_no});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 10),
                        Text(name,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: SizedBox(
                      height: 5,
                    )),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.money,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 10),
                        Text(bill,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(room_no,
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {},
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 40,
                    color: Color.fromRGBO(85, 85, 85, 1),
                  )),
            ],
          )
        ],
      ),
    );
  }
}