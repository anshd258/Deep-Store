import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/screens/Rides/rides.request.dart';

import 'screens/Food/food.request.dart';
import 'screens/home/home.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return CustomTabView(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back!',
                style: GoogleFonts.lato(
                    color: const Color.fromRGBO(86, 86, 86, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            Text('Rahul',
                style: GoogleFonts.lato(
                    color: const Color.fromRGBO(121, 121, 121, 1),
                    fontSize: 19,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      screens: [
        const Home(),
        FoodRequest(),
        const RidesRequest(),
        Container(
          color: Colors.blue,
        ),
      ],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            NavBarIcons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            NavBarIcons.burger,
          ),
          label: 'Food',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            NavBarIcons.ride,
          ),
          label: 'Rides',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            NavBarIcons.account,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
