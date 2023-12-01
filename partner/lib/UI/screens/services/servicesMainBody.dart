import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/Partner.rental.container.dart';
import 'package:partner/UI/widget/partner.food.container.dart';
import 'package:partner/UI/widget/partner.ride.container.dart';
import 'package:partner/UI/widget/partner.vehical.container.dart';
import 'package:partner/middleware/ServicesCubit/services_cubit.dart';
import 'package:partner/middleware/partnercubit/partner_ride_cubit.dart';

class ServicesBody extends StatelessWidget {
  final Services tab;
  const ServicesBody({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: BlocConsumer<ServicesCubit, ServicesState>(
      listener: (context, state) {
        if (state is ServicesError) {
          errorSnackBar(context, state.message!);
        }
      },
      builder: (context, state) {
        if (state is ServicesLoading) {
          return progressIndicator;
        } else if (state is ServicesError) {
          return errorIcon;
        } else if (state is ServicesLoaded) {
          return LiquidPullToRefresh(
            height: 50,
            springAnimationDurationInMilliseconds: 500,
            color: const Color.fromRGBO(34, 150, 199, 1),
            borderWidth: 1,
            showChildOpacityTransition: true,
            onRefresh: () async {
              context.read<ServicesCubit>().onRefresh("route", tab);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 75),
              child: Column(
                children: [
                  if (tab == Services.FOOD && state.food != null)
                    ...state.food!.data!.map(
                      (e) {
                        return PartnerFoodContainer(
                          buttonTitle: "Hide",
                          title1: "Ladakh Special Tea",
                          title2:
                              "(Tea brewed out of fresh tea leaves from farm)",
                          title3: "₹118",
                          tab: tab,
                          veg: false,
                        );
                      },
                    ).toList()
                  else if (tab == Services.HOUSEKEEPING &&
                      state.houseKeeping != null)
                    ...state.houseKeeping!.data!.map(
                      (e) {
                        return PartnerRentalContainer(
                          title1: "John doe",
                          title2: "9:00am - 5:00pm",
                          tab: tab,
                          day: true,
                          url:
                              "https://imgs.search.brave.com/N1AokztSqH-rAvocg5G4ckLUsa9d8jB_cP8VbqGTO7o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE5/ODI0NjYzL3Bob3Rv/L21haWQtYXQtd29y/ay5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9LWdsM3d5TFV1/QlRaaEpyRm5NLXRj/R1ExYjV5WWVkTk5p/WklFSXBNQXRrYz0",
                        );
                      },
                    ).toList()
                  else if (tab == Services.LAUNDERY && state.laundry != null)
                    ...state.laundry!.data!.map(
                      (e) {
                        return PartnerRentalContainer(
                          title1: "Shirts and T-shirts",
                          title2: "₹50/unit",
                          tab: tab,
                          title3: "5 units per guest",
                          url:
                              "https://imgs.search.brave.com/VYQUpR8sPlWzu1Im2yx_U6r4F7w_7mYJfs5GM0Vk9Kw/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by93aGl0ZS10c2hp/cnQtaXMtaGFuZ2lu/Zy1oYW5nZXJfNjE2/MDAxLTQ1ODkuanBn/P3NpemU9NjI2JmV4/dD1qcGc",
                        );
                      },
                    ).toList()
                  else if (tab == Services.RENTALS && state.rental != null)
                    ...state.rental!.data!.map(
                      (e) {
                        return PartnerVehicalContainer();
                      },
                    ).toList()
                  else if (tab == Services.TRANSPORT && state.transport != null)
                    ...state.transport!.data!.map(
                      (e) {
                        return const PartnerRentalContainer(
                          title1: "Joginer singh",
                          title2: "+91 8686845848",
                          url:
                              "https://media.wired.co.uk/photos/63e15d1d8867ad9df8cc4ef2/master/w_1600,c_limit/Rolls-Royce-Spectre-EV-First-Drive-2-Gear.jpg",
                        );
                      },
                    ).toList(),
                ],
              ),
            ),
          );
        } else {
          return const Center();
        }
      },
    ));
  }
}
