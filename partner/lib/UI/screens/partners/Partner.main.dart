import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/body/partner.body.dart';
import 'package:partner/UI/widget/Buttons/graedient.common.button.dart';
import 'package:partner/UI/widget/FilterContainer.dart';
import 'package:partner/middleware/partnercubit/partner_filter_cubit.dart';

class PartnerMain extends StatelessWidget {
  const PartnerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilterWidget(type: "partner"),
            Expanded(flex: 4, child: const PartnerBody())
          ],
        ),
      ),
      floatingActionButton: Builder(builder: (context) {
        var value = context.watch<PartnerFilterCubit>();
        if (value.tabIndex == 1) {
          return GradientCommonButton(
              function: () {
                Navigator.pushNamed(context, "/partner/food/addpartner");
              },
              height: 48,
              margin: const EdgeInsets.all(0),
              borderradius: 100,
              lable: "+",
              fontSize: 30,
              width: 48);
        } else {
          return Center();
        }
      }),
    );
  }
}
