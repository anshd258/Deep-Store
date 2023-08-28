import 'package:customer/data/repositories/data.repository.dart';
import 'package:customer/data/repositories/user.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/models/user.dart';
import 'middleware/blocs/cart/cart_bloc.dart';
import 'middleware/blocs/order/order_bloc.dart';
import 'middleware/blocs/products/products_bloc.dart';
import 'middleware/helpers/app.router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataRepository dataRepository = DataRepository();
  UserRepository userRepository = UserRepository(user: User(01, "Hemant", "9340765396"));
  runApp(MultiBlocProvider(
    providers: [
      
          BlocProvider(
          create: (context) => ProductsBloc(dataRepository),
        ),
        BlocProvider(
          create: (context) => OrderBloc(dataRepository),
        ),
        BlocProvider(
          create: (context) =>
              CartBloc(userRepository, dataRepository),
        ),
      
    ],
    child: MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    ),
  ));
}
