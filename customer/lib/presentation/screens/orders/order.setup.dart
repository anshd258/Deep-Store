import 'package:customer/presentation/screens/orders/foodhistory.dart';
import 'package:customer/presentation/screens/orders/rentalhistory.dart';
import 'package:customer/presentation/screens/orders/ridehistory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/buttons/orderTabBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this, animationDuration: const Duration(microseconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Text(
            "Ongoing requests",
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        OrderTabBar(
            controller: controller, labels: const ['FOOD', 'RIDES', 'RENTALS']),
        Expanded(
          child: TabBarView(

            controller: controller,

            children: const [FoodHistory(), RidesHistory(), RentalHistory()],
          ),
        )
      ],
    );
  }
}
