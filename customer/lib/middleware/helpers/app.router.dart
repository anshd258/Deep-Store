import 'package:customer/presentation/screens/authentication/login.dart';
import 'package:customer/presentation/screens/checkin/checkin.dart';
import 'package:customer/presentation/screens/profile/editprofile.dart';
import 'package:customer/presentation/screens/profile/history/history.setup.dart';
import 'package:customer/presentation/screens/profile/terms.dart';
import 'package:flutter/material.dart';
import '../../presentation/screen.setup.dart';
import '../../presentation/screens/authentication/otp.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      case '/otp':
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case '/checkin':
        return MaterialPageRoute(builder: (_) =>  const CheckIn());
      case '/history':
        return MaterialPageRoute(builder: (_) => const History());
      case '/editprofile':
        return MaterialPageRoute(builder: (_) => const EditProfilePage());
      case '/termsandconditions':
        return MaterialPageRoute(builder: (_) => const TermsAndConditions());
      default:
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
    }
  }
}
