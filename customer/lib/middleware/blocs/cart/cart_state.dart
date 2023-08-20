part of 'cart_bloc.dart';

@immutable
sealed class CartState {
  final FoodOrder? cartOrder;
  const CartState({this.cartOrder});
}

final class CartInitial extends CartState {}

final class UpdateCartState extends CartState {
  UpdateCartState(FoodOrder foodOrder);
}
