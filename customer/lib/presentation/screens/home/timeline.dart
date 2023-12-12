import 'package:customer/constants/colors.dart';
import 'package:customer/constants/nav_bar_icons_icons.dart';
import 'package:customer/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/orders/foodorder.model.dart';
import '../../../data/models/orders/laundryrequest.model.dart';
import '../../../data/models/orders/rentalrequest.model.dart';
import '../../../data/models/orders/taxirequest.model.dart';
import '../../../middleware/blocs/orders/orders_bloc.dart';
import '../../helpers.dart';
import 'cards/daytotal.card.dart';
import 'cards/foodorder.card.dart';
import 'cards/laundary.card.dart';
import 'cards/rentalrequest.card.dart';
import 'cards/taxirequest.card.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          print('building the timeline!!');
          print(state.allOrders);
          return SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: state.allOrders != null
                    ? ListView(children: [
                        /// today's requests
                        if (state.allOrders![formatDate(DateTime.now())] !=
                            null)
                          Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Today\'s requests',
                                          style: CustomTextStyles.subHeading(),
                                        ),
                                        Text(
                                          'view all',
                                          style: CustomTextStyles.subBody(
                                              color: CustomColors.link),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                      children: state.allOrders![
                                              formatDate(DateTime.now())]
                                          ?.map((order) {
                                    switch (order.type) {
                                      case 'FOOD':
                                        order = order as FoodOrder;
                                        return FoodOrderCard(
                                          title: order.details.items.first.name,
                                          titleTrail:
                                              '(${order.details.items.length} orders)',
                                          trailing: '₹ ${order.totalAmount}',
                                          subTitle:
                                              'placed by "${order.orderedBy}"',
                                          items: order.details.items,
                                        );
                                      case 'RENTAL':
                                        order = order as RentalOrder;
                                        return RentalRequestCard(
                                          title: order.details.first.name,
                                          trailing: '₹ ${order.totalAmount}',
                                          subTitle:
                                              'placed by "${order.orderedBy}"',
                                        );
                                      case 'TAXI':
                                        order = order as TaxiOrder;
                                        return TaxiRequestCard(
                                          title: 'Taxi',
                                          trailing: '₹ ${order.totalAmount}',
                                          subTitle:
                                              'placed by "${order.orderedBy}"',
                                        );
                                      case 'LAUNDRY':
                                        order = order as LaundryOrder;
                                        return LaundryRequestCard(
                                            title: 'Laundry',
                                            titleTrail:
                                                '(${order.details.clothsCount} items)',
                                            trailing: '₹ ${order.totalAmount}',
                                            subTitle:
                                                'placed by "${order.orderedBy}"',
                                            icon: NavBarIcons.burger);
                                      default:
                                        Container(
                                          color: Colors.red,
                                          height: 100,
                                        );
                                    }
                                    return Container();
                                  }).toList() as List<Widget>),
                                ],
                              ),

                              /// request timeline
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0, vertical: 12),
                                    child: Text(
                                      'Request timeline',
                                      style: CustomTextStyles.subHeading(),
                                    ),
                                  ),
                                  Builder(builder: (context) {
                                    int dayIndex = 0;
                                    return Column(
                                      children: state.allOrders!.entries
                                          .map((dayrequests) {
                                            dayIndex += 1;
                                            return DayTotalCard(
                                              date: dayrequests.key,
                                              orders: dayrequests.value,
                                              day: dayIndex,
                                              orderQuantity: 12,
                                            );
                                          })
                                          .toList()
                                          .reversed
                                          .toList(),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          )
                      ])
                    : const Center(
                        child: Text('No orders yet!!'),
                      )),
          );
        },
      ),
    );
  }
}
