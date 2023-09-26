import 'package:common/common.dart';
import 'package:customer/middleware/blocs/food/food_bloc.dart';
import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:customer/presentation/screens/Profile/Profile.page.dart';
import 'package:customer/presentation/screens/orders/order.setup.dart';
import 'package:customer/presentation/screens/vehicle/vehicleselect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../middleware/blocs/rentalcubit/rental_cubit.dart';
import 'screens/food/foodselect.dart';

class ScreenSetup extends StatefulWidget {
  const ScreenSetup({super.key});

  @override
  State<ScreenSetup> createState() => _ScreenSetupState();
}

class _ScreenSetupState extends State<ScreenSetup> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
             context.read<FoodBloc>().add(FetchCartOrder());
        context.read<RideBloc>().add(FetchRideRequests());
        context.read<RentalCubit>().fetchAllRentalRequests();
        context.read<FoodBloc>().add(FetchFoodOrders());
       
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTabView(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          NavBarIcons.nestafar,
          size: 35,
          color: Color.fromARGB(255, 8, 176, 176),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back!',
                style: GoogleFonts.lato(
                    color: const Color.fromRGBO(86, 86, 86, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            // Text(context.read<FoodBloc>().userRepository.user!.username ?? '',
            //     style: GoogleFonts.lato(
            //         color: const Color.fromRGBO(121, 121, 121, 1),
            //         fontSize: 19,
            //         fontWeight: FontWeight.w500)),
          ],
        ),
      ),
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
