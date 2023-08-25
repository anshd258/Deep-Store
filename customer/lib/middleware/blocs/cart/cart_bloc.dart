import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:customer/data/datasource.dart';
import 'package:customer/data/models/apiresponse.dart';
import 'package:customer/data/models/food.dart';
import 'package:customer/data/models/fooddetail.dart';
import 'package:customer/data/models/foodorder.dart';
import 'package:customer/data/models/user.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final User user;
  CartBloc(this.user) : super(CartInitial()) {
    on<CartEvent>((event, emit) {});

    on<AddItemToCartEvent>((event, emit) async {
      FoodOrder? order = state.cartOrder;
      // ///if cart is null.
      // if (order == null) {
      //   Map<String, String> urlParameters = {
      //     'location': 'BriCabin',
      //     'user_id': user.userID.toString(),
      //   };
      //   ApiResponse? apiResponse = await DataSource.getData(
      //       path: DataSource.createOrder, urlParameters: urlParameters);
      //   order = apiResponse!.foodOrder;
      // }

      // ///Adding selected addons to order.
      // Map<String, int> selectedAddons = event.selectedAddons;
      // FoodDetails selectedItem = FoodDetails(event.food, selectedAddons, 0);

      // Map<String, dynamic> body = {
      //   'order': {
      //     'id': order?.id ?? 0,
      //     'items': [selectedItem.toJson()],
      //     'user_id': user.userID,
      //   }
      // };
      // await DataSource.getData(
      //     path: DataSource.addItems, queryType: QueryType.post, body: body);

      // /// fetching the latest cart order.
      // Map<String, dynamic> urlParameters = {
      //   'id': (order?.id ?? 0).toString(),
      // };
      // ApiResponse? apiResponse = await DataSource.getData(
      //     path: DataSource.findOrders, urlParameters: urlParameters);

      // order = apiResponse!.foodOrder;

      /// for now I am simulating a order.

      if (state.cartOrder == null) {
        print('trying to add item t cart');
        print('trying to add item to cart');
        print('trying to add item  cart');
        print('trying to add item to cart');
        print(
            'trying to add item t cart ${event.food.price + event.selectedAddons.values.fold(0, (previousValue, element) => previousValue + element)}');
        print('trying to add item  cart');
        print('trying to add item to cart');
        emit(UpdateCartState(
            cartOrder: FoodOrder(
                charges: 0,
                discount: 0,
                eta: DateTime.now(),
                id: 1,
                status: RequestStatus.cart,
                taxes: 0,
                totalPrice: event.food.price +
                        event.selectedAddons.values.fold(0,
                            (previousValue, element) => previousValue + element)
                 ,
                items: [
              FoodDetails(
                  event.food,
                  event.selectedAddons,
                  event.food.price +
                      event.selectedAddons.values.fold(0, (previousValue, element) => previousValue + element))
            ])));
      } else {
        List<FoodDetails> newlist = state.cartOrder!.items;
        newlist.add(FoodDetails(
            event.food,
            event.selectedAddons,
            event.food.price +
                event.selectedAddons.values.fold(0, (previousValue, element) => previousValue + element)));

        emit(UpdateCartState(
            cartOrder: FoodOrder(
                charges: 0,
                discount: 0,
                eta: DateTime.now(),
                id: 1,
                items: newlist,
                taxes: 0,
                totalPrice: state.cartOrder!.totalPrice +
                    event.food.price +
                    event.selectedAddons.values.fold(0, (previousValue, element) => previousValue + element),
                status: RequestStatus.cart)));
      }
    });
  }
}
