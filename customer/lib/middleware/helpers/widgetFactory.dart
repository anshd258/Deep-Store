import 'package:flutter/material.dart';
import '../../presentation/screens/orders/foodorderhistory.dart';
import '../../presentation/screens/orders/rentalhistory.dart';
import '../../presentation/screens/orders/ridehistory.dart';

class Widgetfactory {
  Widget onTabChange(int tabNumber) {
    switch (tabNumber) {
      case 1:
        return FoodHistory();
      case 2:
        return RentalHistory();
      case 3:
        return RidesCard();
      default:
        return FoodHistory();
    }
  }
}
