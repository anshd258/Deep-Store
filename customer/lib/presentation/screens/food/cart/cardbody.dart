import 'package:customer/data/models/fooddetail.dart';
import 'package:customer/middleware/blocs/food/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'itemtile.dart';

class CardBody extends StatelessWidget {
  const CardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodState state = context.read<FoodBloc>().state;
    double total = state.cartOrder!.totalPrice;
    double charges = state.cartOrder!.charges;
    double taxes = (state.cartOrder!.taxes) + charges;
    double discount = state.cartOrder!.discount;
    double toPay = state.cartOrder!.totalPrice;
    List<FoodDetails> items = state.cartOrder!.items.toList();

    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (state.cartOrder!.items.isEmpty) {
          Navigator.pop(context);
        }
      },
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RefreshIndicator(
        onRefresh: () async{},
        child: ListView(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext _, int index) {
                if (items.elementAt(index).quantity > 0) {
                  return ItemTile(
                    item: items.elementAt(index),
                  );
                }

                return const SizedBox.shrink();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10.0);
              },
            ),
            const SizedBox(height: 20.0),
            // const Text(
            //   'Offers',
            //   style: TextStyle(
            //     fontSize: 18.0,
            //   ),
            // ),
            // const SizedBox(
            //   height: 10.0,
            // ),
            // SizedBox(
            //   height: 80,
            //   child: ListView.builder(
            //     itemCount: 4,
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     itemBuilder: (BuildContext _, int index) {
            //       return SizedBox(
            //         width: 160,
            //         child: Card(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: const [
            //                 Text(
            //                   '10% Off',
            //                   style: TextStyle(
            //                     fontSize: 20.0,
            //                   ),
            //                 ),
            //                 Expanded(
            //                   child: Text('on order above \$149'),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runSpacing: 10.0,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Total'),
                      ),
                      Text(
                          'Rs. ${total.toStringAsFixed(2)}')
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Tax & Charges'),
                      ),
                      Text(
                          'Rs. ${taxes.toStringAsFixed(2)}')
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Discount Applied'),
                      ),
                      Text(
                          'Rs. ${discount.toStringAsFixed(2)}')
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'To Pay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Rs. ${toPay.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
