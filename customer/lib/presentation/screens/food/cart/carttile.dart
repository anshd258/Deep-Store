import 'package:customer/presentation/screens/food/cart/cart.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/foodorder.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cart});
  final FoodOrder? cart;

  @override
  Widget build(BuildContext context) {
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
                      onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen())); 

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
