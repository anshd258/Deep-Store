import 'package:customer/presentation/screens/food/cart/cart.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/fooddetail.dart';
import '../../../../data/models/foodorder.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cart});
  final FoodOrder? cart;

  @override
  Widget build(BuildContext context) {
    if (cart != null) {}

    return cart != null
        ? Builder(builder: (context) {
            List<FoodDetails> items = cart!.items;
            items.removeWhere((element) => element.quantity == 0);

            return Row(
              children: [
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 4,
                    shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(cornerRadius: 10)),
                    child: ListTile(
                      title: Text(
                        'Rs.${cart!.totalPrice}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Builder(builder: (context) {
                        List<FoodDetails> items = cart!.items;
                        items.removeWhere((element) => element.quantity == 0);
                        return Text(
                          '${items.length} items',
                        );
                      }),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 213, 213, 213),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            'View Cart',
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
          })
        : Container();
  }
}
