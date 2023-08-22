import 'package:bloc/bloc.dart';
import 'package:customer/data/models/food.dart';
import 'package:customer/data/models/foodorder.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<AddItemToCartEvent>((event, emit) {
      /// 1. if a cart object there add into it. and send it to backend
      /// 2. if not... fetch the latest order and check its status.
      ///    if its cart then append into that.
      /// 3. if no order with cart status. create one with +1 id. and send to backend.
    });
  }
}
