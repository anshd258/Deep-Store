import 'package:flutter/material.dart';
import 'package:partner/UI/screen.setup.dart';
import 'package:partner/UI/screens/History/history.screen.dart';
import 'package:partner/UI/screens/Profile/Edit.profile.dart';
import 'package:partner/UI/screens/auth/login.screen.dart';

import 'package:partner/UI/screens/auth/otp.screen.dart';
import 'package:partner/UI/screens/home/home.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Loginscreen());
      case '/history':
        return MaterialPageRoute(builder: (_) => HistoryScreen());
      case '/editprofile':
        return MaterialPageRoute(builder: (_) => EditProfilePage());
      case '/otpPage':
        return MaterialPageRoute(builder: (_) => OtpScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => ScreenSetup());
      default:
        return MaterialPageRoute(builder: (_) => ScreenSetup());
    }
  }
}
