import 'dart:async';

import 'package:customer/middleware/blocs/food/food_bloc.dart';
import 'package:customer/middleware/blocs/rentalcubit/rental_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/shared_preferences_utils.dart';
import 'package:customer/presentation/screen.setup.dart';
import 'package:customer/presentation/screens/auth/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../middleware/blocs/ride/ride_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
