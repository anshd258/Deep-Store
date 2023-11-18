import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/food.dart';
import '../../../middleware/blocs/food/food_cubit.dart';
import '../../widgets/cards/fooditemcard.dart';
import 'cart/cart.dart';
import 'cart/carttile.dart';

class FoodSelect extends StatelessWidget {
  const FoodSelect({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FoodCubit>().fetchFoods();
      context.read<FoodCubit>().fetchCartOrders();
    });

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<FoodCubit>().fetchCartOrders();
        await context.read<FoodCubit>().fetchFoods();
      },
      child: BlocBuilder<FoodCubit, FoodState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Order Food'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Builder(builder: (context) {
                    List<Food>? foodList =
                        context.read<FoodCubit>().state.foodList;
                    return foodList != null
                        ? foodList.isEmpty
                            ? const Center(
                                child: Text('No food items in your location!'))
                            : ListView.builder(
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
            ),
          );
        },
      ),
    );
  }
}
