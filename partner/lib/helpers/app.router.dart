import 'package:flutter/material.dart';
import 'package:partner/UI/screen.setup.dart';
import 'package:partner/UI/screens/History/history.screen.dart';
import 'package:partner/UI/screens/Profile/Edit.profile.dart';
import 'package:partner/UI/screens/auth/login.screen.dart';

import 'package:partner/UI/screens/auth/otp.screen.dart';
import 'package:partner/UI/screens/partners/Food/partner.add.dart';
import 'package:partner/UI/screens/partners/Food/product.add.dart';
import 'package:partner/UI/screens/partners/Food/product.edit.dart';
import 'package:partner/UI/screens/partners/Food/product.list.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Loginscreen());
      case '/partner/food/addpartner':
        return MaterialPageRoute(builder: (_) => PartnerAddPage());
      case '/partner/food/list':
        return MaterialPageRoute(builder: (_) => PartnerFoodEditPage());
      case '/partner/food/additem':
        return MaterialPageRoute(builder: (_) => FoodProductAdd());
      case '/partner/food/edit':
        return MaterialPageRoute(builder: (_) => PartnerProductEdit());
      case '/history':
        return MaterialPageRoute(
          builder: (_) => HistoryScreen(),
        );
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
