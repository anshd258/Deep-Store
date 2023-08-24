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
      print('emitting new cart state ');
      emit(UpdateCartState(cartOrder :FoodOrder(
          charges: 0,
          discount: 0,
          eta: DateTime.now(),
          id: 1,
          items: [event.food],
          status: RequestStatus.cart,
          taxes: 0,
          totalPrice: 0)));

      print('step 2 ${state.cartOrder}');
    });
  }
}
