import 'package:customer/data/models/fooddetail.dart';
import 'package:customer/middleware/blocs/foodcubit/food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'itemtile.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: BlocBuilder<FoodCubit, FoodState>(
          builder: (context, state) {
                SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (state.cartOrder!.items.isEmpty) {
          Navigator.pop(context);
        }
      },
    );
            return ListView(
              children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.cartOrder!.items.length,
                  itemBuilder: (BuildContext _, int index) {
                    if (state.cartOrder!.items.elementAt(index).quantity > 0) {
                      return ItemTile(
                        item: state.cartOrder!.items.elementAt(index),
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
                //                   child: Text('on order above \'),
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
                          Text('Rs. ${state.cartOrder!.subTotalPrice.toStringAsFixed(2)}')
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text('Tax & Charges'),
                          ),
                          Text('Rs. ${state.cartOrder!.taxes.toStringAsFixed(2)}')
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text('Discount Applied'),
                          ),
                          Text('Rs. ${state.cartOrder!.discount.toStringAsFixed(2)}')
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
                            'Rs. ${state.cartOrder!.totalPrice.toStringAsFixed(2)}',
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
            );
          },
        ),
      ),
    );
  }
}
