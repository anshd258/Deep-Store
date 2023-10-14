import 'package:flutter/material.dart';
import 'package:partner/UI/body/partner.body.dart';
import 'package:partner/UI/widget/FilterContainer.dart';
import 'package:partner/UI/widget/graedient.common.button.dart';

class PartnerMain extends StatelessWidget {
  const PartnerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [FilterWidget(type: "partner"), const PartnerBody()],
      ),
      floatingActionButton: GradientCommonButton(
          function: () {
            Navigator.pushNamed(context, "/partner/food/addpartner");
          },
          height: 48,
          margin: const EdgeInsets.all(0),
          borderradius: 100,
          lable: "+",
          fontSize: 30,
          width: 48),
    );
  }
}
