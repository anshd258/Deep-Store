import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/widget/Partner.rental.container.dart';
import 'package:partner/UI/widget/partner.food.container.dart';
import 'package:partner/UI/widget/partner.ride.container.dart';

import 'package:partner/middleware/partnercubit/partner_filter_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_food_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_rental_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_ride_cubit.dart';

class PartnerBody extends StatefulWidget {
  Services? tab;
  PartnerBody({super.key, this.tab});

  @override
  State<PartnerBody> createState() => _PartnerBodyState();
}

class _PartnerBodyState extends State<PartnerBody> {
  final List _dummyValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    print(widget.tab);
    return Builder(builder: (context) {
      var value = context.watch<PartnerFilterCubit>();
      if (value.tabIndex == 1) {
        return SizedBox(
            child: BlocConsumer<PartnerFoodCubit, PartnerFoodState>(
          listener: (context, state) {},
          builder: (context, state) {
            return LiquidPullToRefresh(
              height: 50,
              springAnimationDurationInMilliseconds: 500,
              color: const Color.fromRGBO(34, 150, 199, 1),
              borderWidth: 1,
              showChildOpacityTransition: true,
              onRefresh: () async {},
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: _dummyValues
                      .map(
                        (e) => const PartnerFoodContainer(
                          buttonTitle: "items",
                          title1: "Ladakh Tea House",
                          title2:
                              "(Tea brewed out of fresh tea leaves from farm)",
                          title3: "9 Items",
                        ),
                      )
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
                return LiquidPullToRefresh(
                  height: 50,
                  springAnimationDurationInMilliseconds: 500,
                  color: const Color.fromRGBO(34, 150, 199, 1),
                  borderWidth: 1,
                  showChildOpacityTransition: true,
                  onRefresh: () async {},
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: _dummyValues
                          .map(
                            (e) => PartnreRideContainer(callback: () {
                              Navigator.pushNamed(
                                  context, "/partner/ride/items");
                            }),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ));
      } else {
        return SizedBox(
          child: BlocConsumer<PartnerRentalCubit, PartnerRentalState>(
            listener: (context, state) {},
            builder: (context, state) {
              return LiquidPullToRefresh(
                height: 50,
                springAnimationDurationInMilliseconds: 500,
                color: const Color.fromRGBO(34, 150, 199, 1),
                borderWidth: 1,
                showChildOpacityTransition: true,
                onRefresh: () async {},
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: _dummyValues
                        .map(
                          (e) => const PartnerRentalContainer(
                              title1: "Joginer singh",
                              title2: "+91 8686845848",
                              url:
                                  "https://media.wired.co.uk/photos/63e15d1d8867ad9df8cc4ef2/master/w_1600,c_limit/Rolls-Royce-Spectre-EV-First-Drive-2-Gear.jpg"),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
