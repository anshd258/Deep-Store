import 'package:customer/data/models/fooddetail.dart';
import 'package:customer/middleware/blocs/foodcubit/food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FoodDetails item;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        FoodDetails item = state.cartOrder!.items.firstWhere((element) => element.food.foodID == widget.item.food.foodID);
    String options = item.selectedAddons.keys.map((e) => e).join(', ');
        return Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          child: ListTile(
            title: Text(item.food.name),
            subtitle: options.isNotEmpty
                ? Text(
                    options,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          10.0,
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                    setState(() {
                                    busy = true;
                                  });
                                  await context.read<FoodCubit>().addItemToCart(

                                      item.food,
                                      1,
                                      item.selectedAddons);
                                        setState(() {
                                    busy = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.black87,
                                  size: 20,
                                ),
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    busy = true;
                                  });
                                  await context
                                      .read<FoodCubit>()
                                      .removeFoodItemFromCart(
                                        item.food,
                                      );

                                  setState(() {
                                    busy = false;
                                  });

                                  /// remove item call
                                },
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.black87,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          if (busy)
                            const Positioned(
                              bottom: 0,
                              left: 0,
                              child: SizedBox(
                                width: 110,
                                child: LinearProgressIndicator(
                                  color: Colors.orange,
                                  backgroundColor: Colors.black12,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Rs. ${item.finalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
