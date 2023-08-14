import 'package:flutter/material.dart';

import '../UI/screens/screen.setup.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  ScreenSetup());
      default:
        return MaterialPageRoute(builder: (_) =>  ScreenSetup());
    }
  }
}
