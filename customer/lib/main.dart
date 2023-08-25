import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/models/user.dart';
import 'middleware/helpers/app.router.dart';
import 'middleware/blocs/authentication/authentication_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(User(01, "Hemant", "9340765396")),
    child: MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    ),
  ));
}
