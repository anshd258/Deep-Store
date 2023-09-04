import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/middleware/auth_cubit.dart';
import 'package:partner/middleware/filter_cubit_cubit.dart';
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
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
      ),
    );
  }
}
