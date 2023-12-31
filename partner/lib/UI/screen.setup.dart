import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:partner/UI/screens/Profile/Profile.page.dart';
import 'package:partner/UI/screens/guest/guest.main.dart';
import 'package:partner/UI/screens/partners/Partner.main.dart';
import 'package:partner/UI/screens/services/servicesMain.dart';

import 'package:partner/Constants/constants.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_rental_request_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_ride_request_cubit.dart';
import 'package:partner/middleware/auth_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';

import 'screens/home/home.dart';

class ScreenSetup extends StatelessWidget {
  const ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialData(context);
    });
    return CustomTabView(
      backgroundColor: Colors.white,
      screens: [
        const Home(),
        const GuestMain(),
        const ServicesMain(),
        PartnerMain(),
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
            Icons.people_alt,
          ),
          label: 'Guest',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            NavBarIcons.ride,
          ),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.diamond_outlined,
          ),
          label: 'Partners',
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
        .getIncomingRequest(StatusFood.processing.code.toString(), "567");
    context.read<IncomingRentalRequestCubit>().getIncomingRequest();
    context.read<IncomingRideRequestCubit>().getIncomingRequest();
    context.read<AcceptedRentalRequestCubit>().getAcceptedRequests();
    context.read<AcceptedRequestsCubit>().getAcceptedRequests();
    context.read<AcceptedRideRequestCubit>().getAcceptedRequests();
    context.read<AuthCubit>().getUserDetails();
  }
}
