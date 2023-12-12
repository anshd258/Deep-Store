import 'package:customer/presentation/screens/home/timeline.dart';
import 'package:customer/presentation/screens/rentals/rentals.setup.dart';
import 'package:customer/presentation/screens/taxi/taxi.setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../middleware/blocs/orders/orders_bloc.dart';
import 'widgets/customtabview.dart';
import '../constants/nav_bar_icons_icons.dart';
import 'screens/food/foodselect.dart';
import 'screens/profile/profile.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      /// as soon as bloc gets created we are firing a event to fetch all orders
      create: (context) => OrdersBloc()..add(GetOrders()),
      child: const CustomTabView(
        screens: [
          Timeline(),
          TaxiSetup(),
          FoodSelect(),
          RentalSetup(),
          ProfilePage()
        ],
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(NavBarIcons.home),
            icon: Icon(
              NavBarIcons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(NavBarIcons.ride),
            icon: Icon(
              NavBarIcons.ride,
            ),
            label: 'Taxi',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(NavBarIcons.burger),
            icon: Icon(
              NavBarIcons.burger,
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(NavBarIcons.bike),
            icon: Icon(
              NavBarIcons.bike,
            ),
            label: 'Rental',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(NavBarIcons.account),
            icon: Icon(
              NavBarIcons.account,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
