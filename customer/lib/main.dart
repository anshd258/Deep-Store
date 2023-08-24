import 'package:customer/data/repository.dart';
import 'package:customer/middleware/blocs/order/order_bloc.dart';
import 'package:customer/middleware/blocs/products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'middleware/helpers/app.router.dart';
import 'middleware/blocs/authentication/authentication_bloc.dart';
import 'middleware/blocs/cart/cart_bloc.dart';

void main() {

  /// Initialize repository.
  Repository repository = Repository();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductsBloc(),
      ),
      BlocProvider(
        create: (context) => OrderBloc(),
      ),
      BlocProvider(
        create: (context) => CartBloc(),
      ),
      BlocProvider(
        create: (context) => AuthenticationBloc(),
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
