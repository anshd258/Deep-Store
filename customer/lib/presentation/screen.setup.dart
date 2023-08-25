import 'package:common/common.dart';
import 'package:customer/presentation/screens/account/account.dart';
import 'package:customer/presentation/screens/home/home.dart';
import 'package:customer/presentation/screens/vehicle/vehicleselect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../middleware/blocs/authentication/authentication_bloc.dart';
import '../middleware/blocs/cart/cart_bloc.dart';
import '../middleware/blocs/order/order_bloc.dart';
import '../middleware/blocs/products/products_bloc.dart';
import 'screens/food/foodselect.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) =>
              CartBloc(context.read<AuthenticationBloc>().state.user!),
        ),
      ],
      child: Builder(builder: (context) {
        context.read<OrderBloc>().add(InitialOrderFetchEvent());
        context.read<ProductsBloc>().add(InitialProductFetchEvent());
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
                Text(context.read<AuthenticationBloc>().state.user!.name,
                    style: GoogleFonts.lato(
                        color: const Color.fromRGBO(121, 121, 121, 1),
                        fontSize: 19,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          screens: const [
            Home(),
            FoodSelect(),
            VehicleSelect(),
            AccountScreen()
          ],
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
      }),
    );
  }
}
