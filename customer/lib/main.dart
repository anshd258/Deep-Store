import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/datasource.dart';
import 'middleware/helpers/app.router.dart';
import 'middleware/blocs/authentication/authentication_bloc.dart';
import 'middleware/blocs/cart/cart_bloc.dart';
import 'middleware/blocs/data/data_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const String backend =
      'brisphere-django-backend.orangeglacier-54abb687.southeastasia.azurecontainerapps.io';
  DataSource.init(backendUrl: backend);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => DataBloc(),
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
