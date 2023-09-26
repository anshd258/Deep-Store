import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/food.dart';
import '../../../middleware/blocs/food/food_bloc.dart';
import '../../widgets/fooditemcard.dart';
import 'cart/cart.dart';
import 'cart/carttile.dart';

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
          print('building food select screen');
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
                            return FoodItemCard(
                              food: food,
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
