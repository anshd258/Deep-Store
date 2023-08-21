import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../middleware/blocs/data/data_bloc.dart';
import '../../middleware/models/foodorder.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        FoodOrder? order = state.foodOrderList!.firstWhere((element) => false);
        return Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black12,
                ),
                child: ListTile(
                  title: Text(
                    'Rs.${order.totalPrice}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${order.items.length} items',
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
        );
      },
    );
    ;
  }
}
