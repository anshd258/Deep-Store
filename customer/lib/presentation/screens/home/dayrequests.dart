import 'package:customer/constants/textstyles.dart';
import 'package:customer/data/models/orders/orders.dart';
import 'package:customer/presentation/helpers.dart';
import 'package:flutter/material.dart';

import '../../../constants/nav_bar_icons_icons.dart';
import '../../../data/models/orders/foodorder.model.dart';
import '../../../data/models/orders/laundryrequest.model.dart';
import '../../../data/models/orders/rentalrequest.model.dart';
import '../../../data/models/orders/taxirequest.model.dart';
import 'cards/foodorder.card.dart';
import 'cards/laundary.card.dart';
import 'cards/rentalrequest.card.dart';
import 'cards/taxirequest.card.dart';

class DayRequests extends StatelessWidget {
  const DayRequests(
      {super.key,
      required this.date,
      required this.orders,
      required this.dayIndex});
  final int dayIndex;
  final String date;
  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Day $dayIndex request details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Builder(builder: (context) {
            String currentTime = '';

            return Column(
                children: orders.map((order) {
              switch (order.type) {
                case 'FOOD':
                  order = order as FoodOrder;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        String orderTime = currentTime;
                        currentTime =
                            parseMillisecondsSinceEpoch(order.dateTime);
                        if (parseMillisecondsSinceEpoch(order.dateTime) !=
                            orderTime) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  date,
                                  style: CustomTextStyles.subBody(),
                                ),
                                Text(
                                  '($currentTime)',
                                  style: CustomTextStyles.subBody(),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      FoodOrderCard(
                        title: order.details.items.first.name,
                        titleTrail: '(${order.details.items.length} orders)',
                        trailing: '₹ ${order.totalAmount}',
                        subTitle: 'placed by "${order.orderedBy}"',
                        items: order.details.items,
                      ),
                    ],
                  );
                case 'RENTAL':
                  order = order as RentalOrder;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        String orderTime = currentTime;
                        currentTime =
                            parseMillisecondsSinceEpoch(order.dateTime);
                        if (parseMillisecondsSinceEpoch(order.dateTime) !=
                            orderTime) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(date,style: CustomTextStyles.subBody(),),
                                Text('($currentTime)',style: CustomTextStyles.subBody(),),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      RentalRequestCard(
                        title: order.details.first.name,
                        trailing: '₹ ${order.totalAmount}',
                        subTitle: 'placed by "${order.orderedBy}"',
                      ),
                    ],
                  );
                case 'TAXI':
                  order = order as TaxiOrder;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        String orderTime = currentTime;
                        currentTime =
                            parseMillisecondsSinceEpoch(order.dateTime);
                        if (parseMillisecondsSinceEpoch(order.dateTime) !=
                            orderTime) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(date,style: CustomTextStyles.subBody(),),
                                Text('($currentTime)',style: CustomTextStyles.subBody(),),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      TaxiRequestCard(
                        title: 'Taxi',
                        trailing: '₹ ${order.totalAmount}',
                        subTitle: 'placed by "${order.orderedBy}"',
                      ),
                    ],
                  );
                case 'LAUNDRY':
                  order = order as LaundryOrder;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        String orderTime = currentTime;
                        currentTime =
                            parseMillisecondsSinceEpoch(order.dateTime);
                        if (parseMillisecondsSinceEpoch(order.dateTime) !=
                            orderTime) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(date,style: CustomTextStyles.subBody(),),
                                Text('($currentTime)',style: CustomTextStyles.subBody(),),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      LaundryRequestCard(
                          title: 'Laundry',
                          titleTrail: '(${order.details.clothsCount} items)',
                          trailing: '₹ ${order.totalAmount}',
                          subTitle: 'placed by "${order.orderedBy}"',
                          icon: NavBarIcons.burger),
                    ],
                  );
                default:
              }
              return Container();
            }).toList());
          }),
        ));
  }
}
