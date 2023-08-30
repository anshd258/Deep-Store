part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}

class FetchFoods extends FoodEvent {}
class FetchFoodOrders extends FoodEvent {}

class AddItemToCartEvent extends FoodEvent {
  final Food food;
  final int quantity;
  final Map<String, int> selectedAddons;

  AddItemToCartEvent(this.food, this.quantity, this.selectedAddons);
  // AddItemQuantity(this.food)
}

class UpdateCartItem extends FoodEvent {
  final Food food;
  final int quantity;
  final Map<String, int> seletedAddons;

  UpdateCartItem(this.food, this.quantity, this.seletedAddons);
}
