import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner/UI/screens/Profile/Profile.page.dart';
import 'package:partner/UI/screens/Rides/rides.request.dart';
import 'package:partner/UI/screens/partners/Partner.main.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_rental_request_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_ride_request_cubit.dart';
import 'package:partner/middleware/auth_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';

import 'screens/Food/food.request.dart';
import 'screens/home/home.dart';

class ScreenSetup extends StatefulWidget {
  const ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;

  @override
  State<ScreenSetup> createState() => _ScreenSetupState();
}

class _ScreenSetupState extends State<ScreenSetup> {
  @override
  void initState() {
    initialData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomTabView(
        backgroundColor: Colors.white,
        screens: const [
          Home(),
          FoodRequest(),
          RidesRequest(),
          // PartnerMain(),
          ProfilePage(),
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
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.diamond_outlined,
          //   ),
          //   label: 'Partners',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              NavBarIcons.account,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  void initialData(BuildContext context) {
    context
        .read<IncomingFoodRequestCubit>()
        .getIncomingRequest(StatusFood.processing.code.toString(), "567");
    context.read<IncomingRentalRequestCubit>().getIncomingRequest();
    context.read<IncomingRideRequestCubit>().getIncomingRequest();
    context.read<AcceptedRentalRequestCubit>().getAcceptedRequests();
    context.read<AcceptedRequestsCubit>().getAcceptedRequests();
    context.read<AcceptedRideRequestCubit>().getAcceptedRequests();
    context.read<AuthCubit>().getUserDetails();
  }
}
