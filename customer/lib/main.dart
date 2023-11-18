import 'package:customer/constants/theme.dart';
import 'package:customer/middleware/blocs/payment/payment_cubit.dart';
import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:customer/middleware/helpers/storage.utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'constants/localstorage.keys.dart';
import 'middleware/blocs/authentication/auth_cubit.dart';
import 'middleware/blocs/food/food_cubit.dart';
import 'middleware/blocs/rental/rental_cubit.dart';
import 'middleware/helpers/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// checking for persistent user token.
  String? accessToken =
      await LocalStorage.read(key: LocalStorageKeys.accessToken);
  if (kDebugMode) {
    print(accessToken);
  }

  /// no need for this location. 
    LocalStorage.write(key: LocalStorageKeys.location, value: 'manali');

  /// global bloc initialization.
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthCubit()),
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
      
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
        ],
      ),
      theme: CustomTheme.appTheme(),
      // initialRoute: '/', 
      initialRoute: accessToken == null ? '/login' : '/',
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    ),
  ));
}
