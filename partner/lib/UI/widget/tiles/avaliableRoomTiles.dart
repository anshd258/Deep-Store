import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableRoomTiiles extends StatelessWidget {
  const AvailableRoomTiiles({
    super.key,
    required this.src,
    required this.s,
    required this.standerd,
    required this.function2,
  });

  final String src;
  final String s;
  final String standerd;
  final Null Function() function2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(10),
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
      child: LayoutBuilder(builder: (context, constrain) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/CheckInGuestDetailsEdit");
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        src,
                        width: constrain.maxWidth - 10,
                        fit: BoxFit.cover,
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Room ${s}",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            Text("${standerd}",
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade700,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          children: [
                            Text("₹2000",
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade700,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                            Text("/night",
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade700,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )
                      ],
                    ))
              ]),
        );
      }),
    );
  }
}