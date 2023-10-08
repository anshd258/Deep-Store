import 'package:customer/presentation/widgets/buttons/commonbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/food.dart';
import '../../../middleware/blocs/food/food_cubit.dart';

class FoodDetailSelector extends StatefulWidget {
  const FoodDetailSelector(
      {super.key, required this.food, required this.outerContext});
  final Food food;
  final BuildContext outerContext;
  @override
  State<FoodDetailSelector> createState() => _FoodDetailSelectorState();
}

class _FoodDetailSelectorState extends State<FoodDetailSelector> {
  bool showLoadingIndicator = false;
  List<String> selecteditems = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  height: MediaQuery.of(context).size.width / 2.5,
                  width: MediaQuery.of(context).size.width / 2.5,
                  widget.food.images ?? "https://dummyimage.com/300",
                  fit: BoxFit.cover,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) =>
                          frame == null
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive())
                              : child,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 9),
                    child: Row(
                      children: [
                        Text(
                          '${widget.food.name},Rs. ${widget.food.price}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.food.description,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Builder(builder: (context) {
            List<MapEntry<String, int>> addons = [];
            if (widget.food.addOns != null) {
              addons = widget.food.addOns!.entries.toList();
            }

            return Wrap(
              children: addons.map((addon) {
                String name = addon.key;
                int price = addon.value;
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        5.0,
                      ),
                    ),
                  ),
                  child: IntrinsicWidth(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      enableFeedback: true,
                      visualDensity: VisualDensity.compact,
                      activeColor: Colors.blue,
                      title: Text(name),
                      subtitle: Text('Rs. $price'),
                      value: selecteditems.contains(addon.key),
                      onChanged: (status) {
                        if (status ?? false) {
                          selecteditems.add(addon.key);
                        } else {
                          selecteditems.remove(addon.key);
                        }
                        setState(() {});
                      },
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        ),
        Container(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Rs. ${widget.food.price}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: CommonButton(
                  height: 58,
                  lable: 'Add to Cart',
                  onPressed: () async {
                    setState(() {
                      showLoadingIndicator = true;
                    });
                    // add item to cart.
                    Map<String, int> selectedAddons = {};
                    Map<String, int> addOns = widget.food.addOns ?? {};
                    for (String item in selecteditems) {
                      if (addOns.containsKey(item)) {
                        selectedAddons[item] = addOns[item] ?? 0;
                      }
                    }
                    print('----------------------------');
                    bool status = await context
                        .read<FoodCubit>()
                        .addItemToCart(widget.food, 1, selectedAddons);
                    // .add(AddItemToCartEvent(widget.food, 1, selectedAddons));
                    setState(() {
                      showLoadingIndicator = false;
                    });
                    if (status) {
                      context.read<FoodCubit>().fetchCartOrders();
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
