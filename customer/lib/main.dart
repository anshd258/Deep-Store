import 'package:customer/middleware/blocs/filtercubit/filter_cubit.dart';
import 'package:customer/middleware/blocs/food/food_bloc.dart';

import 'package:customer/middleware/blocs/rentalcubit/rental_cubit.dart';
import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'middleware/blocs/authentication/auth_cubit.dart';
import 'middleware/helpers/app.router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesUtils.storeString(key: SharedPrefrencesKeys.location, value: 'manali');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FoodBloc(),
      ),
      BlocProvider(
        create: (context) => FilterCubit(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        create: (context) => RideBloc(),
      ),
      BlocProvider(
        create: (context) => RentalCubit(),
      ),
      BlocProvider(
        create: (context) => FoodBloc(),
      ),
    ],
    child: MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    ),
  ));
}
