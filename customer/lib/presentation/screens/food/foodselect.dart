import 'package:customer/presentation/screens/food/cart/cart.dart';
import 'package:customer/presentation/widgets/fooditemcard.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:customer/data/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../middleware/blocs/food/food_bloc.dart';
import 'cart/carttile.dart';
import 'fooddetails.dart';

class FoodSelect extends StatelessWidget {
  const FoodSelect({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<FoodBloc>().add(FetchFoods());
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<FoodBloc>().add(FetchFoods());
      },
      child: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  List<Food>? foodList =
                      context.read<FoodBloc>().state.foodList;
                  return foodList != null
                      ? ListView.builder(
                          itemCount: foodList.length,
                          itemBuilder: (itemContext, index) {
                            Food food = foodList[index];
                            return ServiceCard(
                              name: food.name,
                              description: food.description,
                              price: food.price,
                              images: food.images,
                              onClick: () {
                                showDialog(
                                    barrierColor: Colors.black45,
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: SquicircleContainer(
                                          width: double.infinity,
                                          margin: const EdgeInsets.all(10),
                                          height: 500,
                                          child: FoodDetailSelector(
                                              food: food,
                                              outerContext: itemContext),
                                        ),
                                      );
                                    });
                              },
                            );
                          })
                      : const Center(
                          child: CircularProgressIndicator.adaptive());
                }),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                child: CartTile(
                  cart: state.cartOrder,
                ),
              )
              ////////////////////
            ],
          );
        },
      ),
    );
  }
}
