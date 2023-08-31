import 'package:customer/presentation/screens/auth/login.screen.dart';
import 'package:flutter/material.dart';
import '../../presentation/screen.setup.dart';
import '../../presentation/screens/Profile/Edit.profile.dart';
import '../../presentation/screens/auth/otp.screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
      /// update for authentication first.
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
          case '/editprofile':
        return MaterialPageRoute(builder: (_) => EditProfilePage());
      case '/otpPage':
        return MaterialPageRoute(builder: (_) => OtpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
    }
  }
}
