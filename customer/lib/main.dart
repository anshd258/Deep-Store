import 'package:customer/data/repositories/data.repository.dart';
import 'package:customer/data/repositories/user.repository.dart';
import 'package:customer/middleware/blocs/filtercubit/filter_cubit.dart';
import 'package:customer/middleware/blocs/food/food_bloc.dart';
import 'package:customer/middleware/blocs/rental/rental_bloc.dart';
import 'package:customer/middleware/blocs/ride/ride_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/models/user.dart';
import 'middleware/helpers/app.router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataRepository dataRepository = DataRepository();
  UserRepository userRepository = UserRepository(user: User(01, "Hemant", "9340765396"));
  runApp(MultiBlocProvider(
    providers: [
      
          BlocProvider(
          create: (context) => FoodBloc(userRepository,dataRepository),
        ),
          BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => RideBloc(userRepository,dataRepository),
        ),
        BlocProvider(
          create: (context) => RentalBloc(userRepository,dataRepository),
        ),
        BlocProvider(
          create: (context) =>
              FoodBloc(userRepository, dataRepository),
        ),
      
    ],
    child: MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: '/home',
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    ),
  ));
}
