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

import 'package:partner/middleware/auth_cubit.dart';

import 'package:partner/middleware/incomingRequestCubit/incoming_rental_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_request_cubit.dart';
import 'package:partner/middleware/incomingRequestCubit/incoming_ride_request_cubit.dart';

import 'app.router.dart';

class AppSetup extends StatelessWidget {
  const AppSetup({super.key});

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
          create: (context) => FoodHistoryCubit(),
        ),
        BlocProvider(
          create: (context) => RentalHistoryCubit(),
        ),
        BlocProvider(
          create: (context) => RideHistoryCubit(),
        ),
        BlocProvider(
          create: (context) => AcceptedRequestsCubit(),
        ),
        BlocProvider(
          create: (context) => AcceptedRideRequestCubit(),
        ),
        BlocProvider(
          create: (context) => AcceptedRentalRequestCubit(),
        ),
        BlocProvider(
          create: (context) => IncomingFoodRequestCubit(),
        ),
        BlocProvider(
          create: (context) => IncomingRentalRequestCubit(),
        ),
        BlocProvider(
          create: (context) => IncomingRideRequestCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
      ),
    );
  }
}
