import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/UI/widget/Profile.container.dart';
import 'package:partner/helpers/models/food.request.dart';

class CheckInGuestDetails extends StatelessWidget {
  CheckInGuestDetails({super.key});
  List<int> val = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  List<orders> data = [
    orders(items: [
      Items(name: "allo chips", quantity: "2", total: "500", listedPrice: "250")
    ], qty: "1", total: "500", type: "Food"),
    orders(items: [
      Items(name: "allo chips", quantity: "2", total: "500", listedPrice: "250")
    ], qty: "1", total: "500", type: "Ride"),
    orders(items: [
      Items(name: "allo chips", quantity: "2", total: "500", listedPrice: "250")
    ], qty: "1", total: "500", type: "Rental")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Color(0xFF565656),
        ),
        centerTitle: true,
        title: Text(
          'Booking Details',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: const Color(0xFF565656),
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Swiper(
                      itemCount: val.length,
                      viewportFraction: 0.9,
                      scale: 1,
                      loop: false,
                      axisDirection: AxisDirection.left,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProfileContainer(
                          name: "Alice lee",
                          margin: 15,
                          index: index + 1,
                          length: val.length,
                          email: "test123@gmail.com",
                          phoneNumber: "79828283387",
                          providerId: "5DF46S",
                        );
                      },
                    ),
                  ),
                  LayoutBuilder(builder: (context, constrain) {
                    return SizedBox(
                      height: constraints.maxHeight - 150,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        ...data.map((e) {
                          late IconData iconType;
                          if (e.type == "Food") {
                            iconType = NavBarIcons.burger;
                          } else if (e.type == "Ride") {
                            iconType = NavBarIcons.ride;
                          } else {
                            iconType = Icons.car_rental;
                          }
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.30),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: ExpansionTile(
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  leading: Icon(iconType,
                                      color: Colors.green, size: 30),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${e.name} (X${e.quantity})",
                                                  style: GoogleFonts.lato(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text("₹${e.listedPrice}",
                                                  style: GoogleFonts.lato(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500)),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Total",
                                                style: GoogleFonts.lato(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text("₹${e.total}",
                                                style: GoogleFonts.lato(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]));
                        }).toList(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Text("Taxes and charges",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          height: 105,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.30),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          padding: EdgeInsets.all(8),
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("sgst (%6)",
                                      style: GoogleFonts.lato(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text("₹ 99",
                                      style: GoogleFonts.lato(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("convenience charges",
                                      style: GoogleFonts.lato(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text("₹ 99",
                                      style: GoogleFonts.lato(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("sgst (%6)",
                                      style: GoogleFonts.lato(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                  Text("₹ 99",
                                      style: GoogleFonts.lato(
                                          color: Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.30),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          padding: EdgeInsets.all(8),
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total payable amount",
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                Text("₹ 4700",
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        )
                      ])),
                    );
                  }),
                ],
              ));
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedDeclineButton(
                  function: () {},
                  color: const Color(0xFFC25C5C),
                  icon: Icons.logout_outlined,
                  height: 42,
                  margin: const EdgeInsets.all(2),
                  borderradius: 8,
                  lable: "Checkout",
                  width: 158),
              GradientCommonButton(
                  function: () async {},
                  height: 42,
                  margin: const EdgeInsets.all(2),
                  borderradius: 8,
                  lable: "Update Boking",
                  width: 158)
            ]),
      ),
    );
  }
}

class orders {
  String? type;
  String? total;
  String? qty;
  List<Items>? items;
  orders({this.items, this.total, this.type, this.qty});
}
