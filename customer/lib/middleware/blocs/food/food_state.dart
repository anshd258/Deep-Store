part of 'food_bloc.dart';

@immutable
sealed class FoodState {
  final FoodOrder? cartOrder;
  final List<Food>? foodList;
  final List<FoodOrder>? foodOrderList;

  FoodState({this.cartOrder, this.foodList, this.foodOrderList});
}

final class FoodInitial extends FoodState {}

class UpdateFoodState extends FoodState {
  final FoodOrder? cartOrder;
  final List<Food>? foodList;
  final List<FoodOrder>? foodOrderList;

  UpdateFoodState({this.cartOrder, this.foodList, this.foodOrderList});
}
