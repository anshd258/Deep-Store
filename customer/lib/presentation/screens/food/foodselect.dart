import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 70,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Order Food',
                        style: GoogleFonts.lato(
                            color: const Color.fromRGBO(86, 86, 86, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
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
                                child: Text(
                                    'No food items in your location!'))
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
