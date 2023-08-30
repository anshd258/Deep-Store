import 'package:flutter/material.dart';
import 'package:partner/UI/screen.setup.dart';

import 'package:partner/UI/screens/Rides/rides.request.dart';

import 'package:partner/UI/screens/auth/otp.screen.dart';
import 'package:partner/UI/screens/home/home.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ScreenSetup());
      case '/riderequest':
        return MaterialPageRoute(builder: (_) => RidesRequest());
      case '/otpPage':
        return MaterialPageRoute(builder: (_) => OtpScreen());
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
