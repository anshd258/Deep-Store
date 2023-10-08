import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/UI/widget/partner.food.container.dart';

import 'package:partner/middleware/partnercubit/partner_filter_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_food_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_rental_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_ride_cubit.dart';

class PartnerBody extends StatefulWidget {
  const PartnerBody({super.key});

  @override
  State<PartnerBody> createState() => _PartnerBodyState();
}

class _PartnerBodyState extends State<PartnerBody> {
  List _dummyValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var value = context.watch<PartnerFilterCubit>();
      if (value.tabIndex == 1) {
        return SizedBox(
            height: 512,
            child: BlocConsumer<PartnerFoodCubit, PartnerFoodState>(
              listener: (context, state) {},
              builder: (context, state) {
                return LiquidPullToRefresh(
                  height: 50,
                  springAnimationDurationInMilliseconds: 500,
                  color: Color.fromRGBO(34, 150, 199, 1),
                  borderWidth: 1,
                  showChildOpacityTransition: true,
                  onRefresh: () async {},
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: _dummyValues
                          .map((e) => InkWell(
                                child: PartnerFoodContainer(),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    "/partner/food/editpartner",
                                  );
                                },
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
            ));
      } else if (value.tabIndex == 2) {
        return SizedBox(
            height: 538,
            child: BlocConsumer<PartnerRideCubit, PartnerRideState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Center();
              },
            ));
      } else {
        return SizedBox(
          height: 538,
          child: BlocConsumer<PartnerRentalCubit, PartnerRentalState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Center();
            },
          ),
        );
      }
    });
  }
}
