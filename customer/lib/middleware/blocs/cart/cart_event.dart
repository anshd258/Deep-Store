part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddItemToCartEvent extends CartEvent {
  final Food food;
  final int quantity;
  final Map<String, int> selectedAddons;

  AddItemToCartEvent(this.food, this.quantity, this.selectedAddons);
  // AddItemQuantity(this.food)
}

class UpdateCartItem extends CartEvent {
  final Food food;
  final int quantity;
  final Map<String, int> seletedAddons;

  UpdateCartItem(this.food, this.quantity, this.seletedAddons);
}
