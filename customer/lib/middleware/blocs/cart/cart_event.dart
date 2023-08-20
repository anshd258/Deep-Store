part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddItemToCartEvent extends CartEvent {
  final Food food;
  final int quantity;
  final Map<String, int> selectedAddons;

  AddItemToCartEvent(this.food, this.quantity, this.selectedAddons);
}
