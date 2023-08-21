import 'package:customer/UI/screens/fooddetail.dart';
import 'package:customer/UI/widgets/itemcard.dart';
import 'package:customer/UI/widgets/squicircle.dart';
import 'package:customer/middleware/blocs/data/data_bloc.dart';
import 'package:customer/middleware/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodSelect extends StatelessWidget {
  const FoodSelect({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        print('starting refresh');
        context.read<DataBloc>().add(UpdateDataEvent());
      },
      child: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  List<Food>? foodList =
                      context.read<DataBloc>().state.foodList;
                  return foodList != null
                      ? ListView.builder(
                          itemCount: foodList.length,
                          itemBuilder: (context, index) {
                            /// display the data here
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
                                          child: FoodDetailSelector(  food: food),
                                        ),
                                      );
                                    });

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             FoodDetailSelector(food: food)));
                              },
                            );
                          })
                      : const Center(
                          child: CircularProgressIndicator.adaptive());
                }),
              ),
              ////////////////////
            ],
          );
        },
      ),
    );
  }
}
