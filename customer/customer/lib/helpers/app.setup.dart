import 'package:flutter/material.dart';
import 'app.router.dart';

class AppSetup extends StatelessWidget {
  const AppSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            ///TODO: setup text themes
          )
        ),
        onGenerateRoute: (settings) =>
            AppRouter().onGenerateRoute(settings),
      );
  }
}
