import 'package:customer/middleware/blocs/filtercubit/filter_cubit.dart';
import 'package:customer/middleware/blocs/foodcubit/food_cubit.dart';
import 'package:customer/middleware/blocs/payment/payment_cubit.dart';

import 'package:customer/middleware/blocs/rentalcubit/rental_cubit.dart';
import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/sharedprefrence.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'middleware/blocs/authentication/auth_cubit.dart';
import 'middleware/helpers/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesUtils.storeString(
      key: SharedPrefrencesKeys.location, value: 'manali');
  String? accessToken = await SharedPreferencesUtils.getString(key: SharedPrefrencesKeys.accessToken);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FilterCubit(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        create: (context) => RideCubit(),
      ),
      BlocProvider(
        create: (context) => RentalCubit(),
      ),
      BlocProvider(
        create: (context) => FoodCubit(),
      ),
      BlocProvider(
        create: (context) => PaymentCubit(),
      ),
    ],
    child: MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
        ],
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute:accessToken == null ? '/' : '/home',
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    ),
  ));
}
