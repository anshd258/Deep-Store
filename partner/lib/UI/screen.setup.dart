import 'package:flutter/material.dart';
import 'package:partner/UI/body/ridesbody.dart';
import 'package:partner/UI/widget/ownerOngoingcard.dart';
import 'package:partner/UI/widget/ridesCard.dart';

import 'widget/FilterContainer.dart';

class ScreenSetup extends StatelessWidget {
  ScreenSetup({super.key, this.appBar});
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // RidesCard(),
            FilterWidget(),
            RidesBody()
          ],
        ),
      ),
    );
  }
}
