import 'package:customer/presentation/screens/profile/history/foodhistory.dart';
import 'package:customer/presentation/screens/profile/history/rentalhistory.dart';
import 'package:customer/presentation/screens/profile/history/ridehistory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/buttons/orderTabBar.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HomeState();
}

class _HomeState extends State<History> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(microseconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text('Request History',
                  style: GoogleFonts.lato(
                      color: const Color.fromRGBO(86, 86, 86, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderTabBar(
              controller: controller,
              labels: const ['Food', 'Rentals', 'Rides']),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                FoodHistoryCard(),
                RentalHistoryCard(),
                RidesHistoryCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
