import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/partner.food.container.dart';
import 'package:partner/middleware/ServicesCubit/services_cubit.dart';

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
              child: Column(
                children: [
                  if (tab == Services.FOOD && state.food != null)
                    ...state.food!.data!.map(
                      (e) {
                        return PartnerFoodContainer();
                      },
                    ).toList()
                  else if (tab == Services.HOUSEKEEPING &&
                      state.houseKeeping != null)
                    ...state.houseKeeping!.data!.map(
                      (e) {
                        return PartnerFoodContainer();
                      },
                    ).toList()
                  else if (tab == Services.LAUNDERY && state.laundry != null)
                    ...state.laundry!.data!.map(
                      (e) {
                        return PartnerFoodContainer();
                      },
                    ).toList()
                  else if (tab == Services.RENTALS && state.rental != null)
                    ...state.rental!.data!.map(
                      (e) {
                        return PartnerFoodContainer();
                      },
                    ).toList()
                  else if (tab == Services.TRANSPORT && state.transport != null)
                    ...state.transport!.data!.map(
                      (e) {
                        return PartnerFoodContainer();
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
