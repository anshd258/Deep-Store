import 'package:common/common.dart';
import 'package:customer/UI/screens/foodselect.dart';
import 'package:customer/UI/screens/rentalselect.dart';
import 'package:customer/UI/screens/rideselect.dart';
import 'package:customer/middleware/blocs/data/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/twoitemtabview.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    context.read<DataBloc>().add(UpdateDataEvent());

    return CustomTabView(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          NavBarIcons.account,
          color: Colors.blue,
        ),
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
      screens:  const [
        RentalSelect(),
        FoodSelect(),
        TwoItemTabView(child1: RideSelect(),child2: RentalSelect(),tab1: Tab(text: 'rent a ride'),tab2: Tab(text: 'book a ride',),),
        TwoItemTabView(child1: RideSelect(),child2: RentalSelect(),tab1: Tab(text: 'rent a ride'),tab2: Tab(text: 'book a ride',),)
    
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
