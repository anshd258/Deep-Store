import 'package:customer/constants/colors.dart';
import 'package:customer/constants/textstyles.dart';
import 'package:customer/data/models/orders/orders.dart';
import 'package:customer/presentation/screens/home/dayrequests.dart';
import 'package:flutter/material.dart';

class DayTotalCard extends StatelessWidget {
  const DayTotalCard({
    super.key,
    required this.day,
    required this.orderQuantity,
    required this.orders,
    required this.date,
  });
  final int day;
  final String date;
  final int orderQuantity;
  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DayRequests(
                          date: date,
                          orders: orders,
                          dayIndex: day,
                        )));
          },
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Day $day ',
                            style: CustomTextStyles.body(color: Colors.black),
                          ),
                          Text(
                            '($date)',
                            style: CustomTextStyles.subBody(
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$orderQuantity orders placed',
                        style: CustomTextStyles.body(
                            fontWeight: FontWeight.w400,
                            color: CustomColors.lightBlack90),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Builder(builder: (context) {
                        double totalAmount = 0;
                        for (var element in orders) {
                          totalAmount += element.totalAmount;
                        }
                        return Text(
                          'Rs $totalAmount',
                          style: CustomTextStyles.body(
                              fontWeight: FontWeight.w400,
                              color: CustomColors.lightBlack90),
                        );
                      }),
                    ],
                  ),
                  const Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),
            ),
          ),
        ));
  }
}
