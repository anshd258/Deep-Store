import 'package:customer/middleware/blocs/products/products_bloc.dart';
import 'package:customer/presentation/widgets/itemcard.dart';
import 'package:customer/presentation/widgets/squicircle.dart';
import 'package:customer/data/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fooddetailselector.dart';

class FoodSelect extends StatelessWidget {
  const FoodSelect({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<ProductsBloc>().add(UpdateFoodListEvent());
      },
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  List<Food>? foodList =
                      context.read<ProductsBloc>().state.foodList;
                  return foodList != null
                      ? ListView.builder(
                          itemCount: foodList.length,
                          itemBuilder: (context, index) {
                            Food food = foodList[index];
                            return ServiceCard(
                              name: food.name,
                              description: food.description,
                              price: food.price,
                              images: food.images,
                              onClick: () {
                                showDialog(
                                    barrierColor: Colors.black26,
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: SquicircleContainer(
                                          width: 300,
                                          height: 600,
                                          child: FoodDetailSelector(food: food),
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
              // CartTile()
              ////////////////////
            ],
          );
        },
      ),
    );
  }
}
