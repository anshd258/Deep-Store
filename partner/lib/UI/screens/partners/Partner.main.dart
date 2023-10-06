import 'package:flutter/material.dart';
import 'package:partner/UI/body/partner.body.dart';
import 'package:partner/UI/widget/FilterContainer.dart';

class PartnerMain extends StatelessWidget {
  const PartnerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [FilterWidget(type: "partner"), PartnerBody()],
      ),
    );
  }
}
