import 'package:common/common.dart';
import 'package:customer/presentation/screens/orders/order.setup.dart';
import 'package:customer/presentation/screens/vehicle/vehicleselect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return CustomTabView(
      screens: const [Home(), FoodSelect(), VehicleSelect(), ProfilePage()],
      items: [
        BottomNavigationBarItem(
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(47, 251, 227, 1),
                  Color.fromRGBO(29, 172, 157, 1),
                ],
              ).createShader(const Rect.fromLTWH(0, 0, 300, 300));
            },
            child: const Icon(NavBarIcons.home),
          ),
          icon: const Icon(
            NavBarIcons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(47, 251, 227, 1),
                  Color.fromRGBO(29, 172, 157, 1),
                ],
              ).createShader(const Rect.fromLTWH(0, 0, 300, 300));
            },
            child: const Icon(NavBarIcons.burger),
          ),
          icon: const Icon(
            NavBarIcons.burger,
          ),
          label: 'Food',
        ),
        BottomNavigationBarItem(
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(47, 251, 227, 1),
                  Color.fromRGBO(29, 172, 157, 1),
                ],
              ).createShader(const Rect.fromLTWH(0, 0, 300, 300));
            },
            child: const Icon(NavBarIcons.ride),
          ),
          icon: const Icon(
            NavBarIcons.ride,
          ),
          label: 'Rides',
        ),
        BottomNavigationBarItem(
          activeIcon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(47, 251, 227, 1),
                  Color.fromRGBO(29, 172, 157, 1),
                ],
              ).createShader(const Rect.fromLTWH(0, 0, 300, 300));
            },
            child: const Icon(NavBarIcons.account),
          ),
          icon: const Icon(
            NavBarIcons.account,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
