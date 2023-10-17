import 'package:customer/presentation/screens/auth/checkin..dart';
import 'package:customer/presentation/screens/auth/email.dart';
import 'package:customer/presentation/screens/auth/login.dart';
import 'package:customer/presentation/screens/orders/order.setup.dart';
import 'package:customer/presentation/screens/profile/terms.dart';
import 'package:flutter/material.dart';
import '../../presentation/screen.setup.dart';
import '../../presentation/screens/Profile/Edit.profile.dart';
import '../../presentation/screens/auth/name.dart';
import '../../presentation/screens/auth/otp.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      case '/otp':
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
      case '/registername':
        return MaterialPageRoute(builder: (_) => const RegistrationName());
      case '/registeremail':
        return MaterialPageRoute(builder: (_) => const RegistrationEmail());
      case '/checkin':
        return MaterialPageRoute(builder: (_) => const CheckInScreen());
      case '/history':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/editprofile':
        return MaterialPageRoute(builder: (_) => const EditProfilePage());
      case '/termsandconditions':
        return MaterialPageRoute(builder: (_) => const TermsAndConditions());
      default:
        return MaterialPageRoute(builder: (_) => const ScreenSetup());
    }
  }
}
