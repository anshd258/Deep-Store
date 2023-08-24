import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/foodorder.dart';
import '../../../middleware/blocs/cart/cart_bloc.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cart});
  final FoodOrder? cart;

  @override
  Widget build(BuildContext context) {
    print('building car tile ${context.read<CartBloc>().state.cartOrder}');
    return cart != null
        ? Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                      ),
                      child: ListTile(
                        title: Text(
                          'Rs.${cart!.totalPrice}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${cart!.items.length} items',
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                          ),
                          onPressed: () async {
                            // await Navigator.pushNamed(
                            //   context,
                            //   AppRoutes.cart,
                            // );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'View',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
        : Container();
  }
}
