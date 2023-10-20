import 'package:common/common.dart';
import 'package:customer/presentation/screens/orders/order.setup.dart';
import 'package:customer/presentation/screens/vehicle/vehicleselect.dart';
import 'package:flutter/material.dart';
import '../middleware/helpers/constants.dart';
import '../middleware/helpers/sharedprefrence.utils.dart';
import 'screens/food/foodselect.dart';
import 'screens/profile/profile.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesUtils.storeString(
        key: SharedPrefrencesKeys.location, value: 'manali');
    return const CustomTabView(
      screens: [Home(), FoodSelect(), VehicleSelect(), ProfilePage()],
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(NavBarIcons.home),
          icon: Icon(
            NavBarIcons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(NavBarIcons.burger),
          icon: Icon(
            NavBarIcons.burger,
          ),
          label: 'Food',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(NavBarIcons.ride),
          icon: Icon(
            NavBarIcons.ride,
          ),
          label: 'Rides',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(NavBarIcons.account),
          icon: Icon(
            NavBarIcons.account,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
