import 'package:flutter/material.dart';
import 'package:partner/UI/widget/ownerOngoingcard.dart';
import 'package:partner/UI/widget/ridesCard.dart';

class Widgetfactory {
  Widget onTabChange(int tabNumber) {
    switch (tabNumber) {
      case 3:
        return RidesCard();
      default:
        return ownerOngoingcards();
    }
  }
}
