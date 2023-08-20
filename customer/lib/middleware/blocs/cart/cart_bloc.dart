import 'package:bloc/bloc.dart';
import 'package:customer/middleware/models/food.dart';
import 'package:customer/middleware/models/foodorder.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<AddItemToCartEvent>((event, emit) {
      /// send request to backend to add item to cart.
      /// in return we should get a FoodOrder which has the discounts and charges.
      /// emit(UpdateCartState(FoodOrder()));
    });
  }
}
