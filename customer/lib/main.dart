import 'package:customer/middleware/blocs/payment/payment_cubit.dart';

import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/sharedprefrence.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'middleware/blocs/authentication/auth_cubit.dart';
import 'middleware/blocs/food/food_cubit.dart';
import 'middleware/blocs/rental/rental_cubit.dart';
import 'middleware/helpers/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? accessToken = await SharedPreferencesUtils.getString(
      key: SharedPrefrencesKeys.accessToken);
  print(accessToken);

  runApp(BlocProvider(
    create: (context) => AuthCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
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
      initialRoute: accessToken == null ? '/' : '/home',
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    ),
  ));
}
