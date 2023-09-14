import 'package:flutter/material.dart';
import 'package:partner/UI/body/ridesbody.dart';
import 'package:partner/UI/widget/FilterContainer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RidesCard(),
        FilterWidget(type: "Accepted"),
        RidesBody()
      ],
    );
  }
}
