part of 'food_cubit.dart';

@immutable
sealed class FoodState {
  final FoodOrder? cartOrder;
  final List<Food>? foodList;
  final List<FoodOrder>? foodOrderList;

 const FoodState({this.cartOrder, this.foodList, this.foodOrderList});
}

final class FoodInitial extends FoodState {}

class UpdateFoodState extends FoodState {
  const UpdateFoodState({super.cartOrder, super.foodList, super.foodOrderList});
}
