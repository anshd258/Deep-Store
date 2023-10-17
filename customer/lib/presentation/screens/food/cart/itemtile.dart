// ignore_for_file: unnecessary_const

import 'package:customer/data/models/fooddetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../middleware/blocs/food/food_cubit.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    Key? key,
    required this.foodDetails,
  }) : super(key: key);

  final FoodDetails foodDetails;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        FoodDetails item = state.cartOrder!.items.firstWhere(
            (element) => element.itemId == widget.foodDetails.itemId);
        String options = item.selectedAddons.keys.map((e) => e).join(', ');
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(204, 204, 204, 1)),
            // gradient: const LinearGradient(colors: [
            //   Color.fromRGBO(32, 171, 154, 1),
            //   Color.fromRGBO(34, 150, 199, 1)
            // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          child: ListTile(
            title: Text(item.itemName),
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
                                    item.total,
                                    item.discount,

                                      item.itemId,
                                       1, item.selectedAddons);
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
                                        widget.foodDetails.foodDetailId,
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
                                  color: Color.fromRGBO(32, 171, 154, 1),
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
                    'Rs. ${item.total.toStringAsFixed(2)}',
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
