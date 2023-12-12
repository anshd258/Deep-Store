import 'package:customer/constants/colors.dart';
import 'package:customer/constants/textstyles.dart';
import 'package:flutter/material.dart';

import '../../../../constants/nav_bar_icons_icons.dart';
import '../../../../data/models/orders/foodorder.model.dart';

class FoodOrderCard extends StatelessWidget {
  const FoodOrderCard(
      {super.key,
      required this.title,
      this.titleTrail,
      this.subTitle,
      required this.trailing,
      required this.items});
  final String title;
  final String? titleTrail;
  final String? subTitle;
  final String trailing;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              leading: const Icon(
                NavBarIcons.burger,
                size: 35,
                color: CustomColors.green,
              ),
              childrenPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    title,
                                    style: CustomTextStyles.body(
                                        color: Colors.black),
                                  ),
                                  Text(
                                    titleTrail ?? '',
                                    style: CustomTextStyles.subBody(),
                                  ),
                                ],
                              ),
                              Text(
                                subTitle ?? '',
                                style: CustomTextStyles.subBody(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          trailing,
                          style: CustomTextStyles.body(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 7,
                              child: Text(
                                'Item list',
                                style: CustomTextStyles.subBody(),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Price',
                                style: CustomTextStyles.subBody(),
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: items
                          .map(
                            (item) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Text(
                                        '${item.name} (x${item.quantity})',
                                        style: CustomTextStyles.subBody(
                                            color: const Color(0xFF2B2B2B),
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        '₹ ${item.price * item.quantity}',
                                        style: CustomTextStyles.subBody(
                                            color: const Color(0xFF2B2B2B),
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Builder(builder: (context) {
                      double totalPrice = 0;
                      for (var element in items) {
                        totalPrice += element.price * element.quantity;
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 7,
                                child: Container(
                                  child: Text(
                                    'Total price',
                                    style: CustomTextStyles.subBody(
                                        color: const Color(0xFF2B2B2B),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  child: Text(
                                    '₹ $totalPrice',
                                    style: CustomTextStyles.subBody(
                                        color: const Color(0xFF2B2B2B),
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ]),
        ));
  }
}
