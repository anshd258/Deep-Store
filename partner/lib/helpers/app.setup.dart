import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_rental_request_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_requests_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/accepted_ride_request_cubit.dart';
import 'package:partner/middleware/AcceptedRequestCubit/filter_cubit_cubit.dart';
import 'package:partner/middleware/HistoryCubit/food_history_cubit.dart';
import 'package:partner/middleware/HistoryCubit/history_filter_cubit.dart';
import 'package:partner/middleware/HistoryCubit/rental_history_cubit.dart';
import 'package:partner/middleware/HistoryCubit/ride_history_cubit.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';
import 'package:partner/middleware/ServicesCubit/services_cubit.dart';
import 'package:partner/middleware/guestcubits/available_rooms_cubit.dart';
import 'package:partner/middleware/guestcubits/checked_in_rooms_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:partner/middleware/auth_cubit.dart';

import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_filter_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_food_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_rental_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_ride_cubit.dart';

import 'app.router.dart';

class AppSetup extends StatelessWidget {
  const AppSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<Authrepository>(create: (context) => Authrepository()),
    ], child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FilterCubitCubit(),
        ),
        BlocProvider(
          create: (context) => HistoryFilterCubit(),
        ),
        BlocProvider(
          create: (context) => PartnerFilterCubit(),
        ),
        BlocProvider(
          create: (context) => PartnerFoodCubit(),
        ),
        BlocProvider(
          create: (context) => PartnerRideCubit(),
        ),
        BlocProvider(
          create: (context) => PartnerRentalCubit(),
        ),
        BlocProvider(
          create: (context) =>
              FoodHistoryCubit(RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) => RentalHistoryCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) =>
              RideHistoryCubit(RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) => AcceptedRequestsCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) => AcceptedRideRequestCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
         BlocProvider(
          create: (context) => ServicesCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        
          BlocProvider(
          create: (context) => CheckedInRoomsCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),  BlocProvider(
          create: (context) => AvailableRoomsCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) => AcceptedRentalRequestCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) => IncomingFoodRequestCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) => IncomingRentalRequestCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) => IncomingRideRequestCubit(
              RepositoryProvider.of<Authrepository>(context)),
        ),
        BlocProvider(
          create: (context) =>
              AuthCubit(RepositoryProvider.of<Authrepository>(context)),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, child!),
            breakpoints: [
              ResponsiveBreakpoint.autoScaleDown(350, name: MOBILE),
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(1700, name: DESKTOP),
            ]),
        onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
      ),
    );
  }
}
