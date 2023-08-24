import 'package:flutter/material.dart';
import 'package:partner/UI/screens/auth/login.screen.dart';
import 'package:partner/UI/screens/auth/otp.screen.dart';

import '../UI/screen.setup.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Loginscreen());
        case '/otpPage':
        return MaterialPageRoute(builder: (_) => OtpScreen());
      default:
        return MaterialPageRoute(builder: (_) => ScreenSetup());
    }
  }
}
