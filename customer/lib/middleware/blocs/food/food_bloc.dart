import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:customer/data/models/food.dart';
import 'package:customer/data/models/foodorder.dart';
import 'package:customer/data/repositories/datasource.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../data/models/apiresponse.dart';
import '../../../data/models/fooddetail.dart';
import '../../../data/repositories/data.repository.dart';
import '../../../data/repositories/user.repository.dart';
import '../../helpers/constants.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final UserRepository userRepository;
  final DataRepository dataRepository;
  FoodBloc(this.userRepository, this.dataRepository) : super(FoodInitial()) {
    on<FoodEvent>((event, emit) {});

    on<FetchFoods>((event, emit) async {
      Map<String, dynamic> parameters = {"location": "BriCabin"};
      await DataSource.getData(
        path: DataSource.getAllFoods,
        urlParameters: parameters,
      ).then((value) {
        if (value != null) {
          emit(UpdateFoodState(
            foodList: value.foodItems,
          ));
        } else {}
      });
    });

    on<FetchFoodOrders>((event, emit) async {
      Map<String, dynamic> parameters = {"user_id": "1"};
      await DataSource.getData(
        path: DataSource.getAllFoodOrder,
        urlParameters: parameters,
      ).then((value) {
        if (value != null) {
          emit(UpdateFoodState(
            foodOrderList: value.foodOrders,
          ));
        } else {}
      });
    });

    on<AddItemToCartEvent>((event, emit) {
      // FoodOrder? order = state.cartOrder;

      // ///if cart is null.
      // if (order == null) {
      //   Map<String, String> urlParameters = {
      //     'location': 'BriCabin',
      //     'user_id': userRepository.user!.userID.toString(),
      //   };
      //   ApiResponse? apiResponse = await DataSource.getData(
      //       path: DataSource.createOrder, urlParameters: urlParameters);
      //   order = apiResponse!.foodOrder;
      // }

      // ///Adding selected addons to order.
      // Map<String, int> selectedAddons = event.selectedAddons;
      // FoodDetails selectedItem = FoodDetails(event.food, selectedAddons, 0,1);

      // Map<String, dynamic> body = {
      //   'order': {
      //     'id': order?.id ?? 0,
      //     'items': [selectedItem.toJson()],
      //     'user_id': userRepository.user!.userID,
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

      // for now I am simulating a order.

      if (state.cartOrder == null) {
        emit(UpdateFoodState(
            foodList: state.foodList,
            foodOrderList: state.foodOrderList,
            cartOrder: FoodOrder(
                charges: 0,
                discount: 0,
                eta: DateTime.now(),
                id: 1,
                status: RequestStatus.cart,
                taxes: 0,
                totalPrice: event.food.price +
                    event.selectedAddons.values.fold(
                        0, (previousValue, element) => previousValue + element),
                items: [
                  FoodDetails(
                      event.food,
                      event.selectedAddons,
                      event.food.price +
                          event.selectedAddons.values.fold(
                              0,
                              (previousValue, element) =>
                                  previousValue + element).toDouble(),
                      1),
                ])));
      } else {
        List<FoodDetails> newlist = state.cartOrder!.items;
        newlist.add(FoodDetails(
            event.food,
            event.selectedAddons,
            event.food.price +
                event.selectedAddons.values.fold(
                    0, (previousValue, element) => previousValue + element),
            1));

        emit(UpdateFoodState(
            foodList: state.foodList,
            foodOrderList: state.foodOrderList,
            cartOrder: FoodOrder(
                charges: 0,
                discount: 0,
                eta: DateTime.now(),
                id: 1,
                items: newlist,
                taxes: 0,
                totalPrice: state.cartOrder!.totalPrice +
                    event.food.price +
                    event.selectedAddons.values.fold(
                        0, (previousValue, element) => previousValue + element),
                status: RequestStatus.cart)));
      }
    });
  }
}
