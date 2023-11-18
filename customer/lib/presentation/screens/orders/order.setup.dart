import 'package:customer/constants/textstyles.dart';
import 'package:customer/presentation/screens/orders/foodorder.card.dart';
import 'package:customer/presentation/screens/orders/rentalrequest.card.dart';
import 'package:customer/presentation/screens/orders/riderequest.card.dart';
import 'package:flutter/material.dart';

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
    controller = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(microseconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Text("Ongoing requests",
                        style: CustomTextStyles.subHeading()),
                  ),
                  OrderTabBar(
                      controller: controller,
                      labels: const ['Food', 'Rentals', 'Rides']),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: const [
                  FoodOrderCard(),
                  RentalRequestCard(),
                  RidesRequestCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
