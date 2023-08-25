import 'package:flutter/material.dart';
import '../../presentation/screen.setup.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
      /// update for authentication first.
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
      default:
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
    }
  }
}
