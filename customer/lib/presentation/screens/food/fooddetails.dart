import 'package:customer/middleware/blocs/food/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/food.dart';

class FoodDetailSelector extends StatefulWidget {
  const FoodDetailSelector(
      {super.key, required this.food, required this.outerContext});
  final Food food;
  final BuildContext outerContext;
  @override
  State<FoodDetailSelector> createState() => _FoodDetailSelectorState();
}

class _FoodDetailSelectorState extends State<FoodDetailSelector> {
  List<String> selecteditems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          runSpacing: 10.0,
          alignment: WrapAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                 'https://images.unsplash.com/photo-1550547660-d9450f859349?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                    frame == null
                        ? const Center(
                            child: CircularProgressIndicator.adaptive())
                        : child,
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.food.name},Rs. ${widget.food.price}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    widget.food.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Builder(builder: (context) {
              List<MapEntry<String, int>> addons = [];
              if(widget.food.addOns != null) {
                addons =
                  widget.food.addOns!.entries.toList();
              }

              return ListView.separated(
                shrinkWrap: true,
                itemCount: addons.length,
                itemBuilder: (BuildContext _, int index) {
                  String name = addons.elementAt(index).key;
                  int price = addons.elementAt(index).value;

                  return Container(
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
                    child: CheckboxListTile(
                      activeColor: Colors.blue,
                      title: Text(name),
                      subtitle: Text('Rs. $price'),
                      value:
                          selecteditems.contains(addons.elementAt(index).key),
                      onChanged: (status) {
                        if (status ?? false) {
                          selecteditems.add(addons.elementAt(index).key);
                        } else {
                          selecteditems.remove(addons.elementAt(index).key);
                        }
                        setState(() {});
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(32, 171, 154, 1),
          Color.fromRGBO(34, 150, 199, 1),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: ElevatedButton(
          style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
          child: const Text('Add to Cart'),
          onPressed: () async {
            // add item to cart.
            Map<String, int> selectedAddons = {};
            Map<String, int> addOns = widget.food.addOns ?? {};
            for (String item in selecteditems) {
              if (addOns.containsKey(item)) {
                selectedAddons[item] = addOns[item] ?? 0;
              }
            }
            context
                .read<FoodBloc>()
                .add(AddItemToCartEvent(widget.food, 1, selectedAddons));
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
