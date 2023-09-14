import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/screens/Profile/Profile.page.dart';
import 'package:partner/UI/screens/Rides/rides.request.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_rental_request_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_ride_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';

import 'screens/Food/food.request.dart';
import 'screens/home/home.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    initialData(context);

    return CustomTabView(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back!',
                style: GoogleFonts.lato(
                    color: const Color.fromRGBO(86, 86, 86, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
            Text('Rahul',
                style: GoogleFonts.lato(
                    color: const Color.fromRGBO(121, 121, 121, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      screens: [
        const Home(),
        FoodRequest(),
        const RidesRequest(),
        const ProfilePage(),
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

  void initialData(BuildContext context) {
    context
        .read<IncomingFoodRequestCubit>()
        .getIncomingRequest(StatusFood.processing.code.toString());
    context
        .read<IncomingRentalRequestCubit>()
        .getIncomingRequest(StatusRideRental.pending.code.toString());
    context
        .read<IncomingRideRequestCubit>()
        .getIncomingRequest(StatusRideRental.pending.code.toString());
    context.read<AcceptedRentalRequestCubit>().getAcceptedRequests();
    context.read<AcceptedRequestsCubit>().getAcceptedRequests();
    context.read<AcceptedRideRequestCubit>().getAcceptedRequests();
  }
}
