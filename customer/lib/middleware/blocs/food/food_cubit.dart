
import 'package:bloc/bloc.dart';
import 'package:customer/data/apiservice.dart';
import 'package:customer/middleware/helpers/storage.utils.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../../../constants/apiendpoints.dart';
import '../../../constants/localstorage.keys.dart';
import '../../../data/models/food.dart';
import '../../../data/models/foodorder.dart';
import '../../../constants/enums.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  void clear() {
    emit(FoodInitial());
  }

  Future<bool> updateOrderStatus(String orderId, OrderStatus status) async {
    Map<String, dynamic> body = {
      "order": {"id": orderId, "status": status.index}
    };
    Map<String, dynamic>? response = await ApiService.post(
        endpoint: ApiEndpoints.updateFoodOrder, body: body);
    if (response != null) {
      return true;
    }
    return false;
  }

  Future<bool> addItemToCart(double finalPrice, double discount, int itemId,
      int quantity, Map<String, int> selectedAddons) async {
    bool status = false;
    FoodOrder? order = state.cartOrder;

    ///if cart is null.
    /// 1. check if there is a order on hold
    /// 2. if not then create new order
    if (order == null) {
      Map<String, String> urlParameters = {
        'location': 'manali',
      };

      Map<String, dynamic>? response = await ApiService.get(
          endpoint: ApiEndpoints.createFoodOrder, urlParameters: urlParameters);
      order = FoodOrder.fromJson(response!['order']);
    }

    ///Adding selected addons to order.

    Map<String, dynamic> body = {
      'order': {
        'id': order.id,
        'items': [
          {
            'id': itemId,
            'final_price': finalPrice,
            'option': selectedAddons,
            'quantity': quantity,
            'discount': discount
          }
        ],
      }
    };
    try {
      Map<String, dynamic>? response =
          await ApiService.post(endpoint: ApiEndpoints.addFoodItem, body: body);
      status = response!['status'] == 'success';

      /// fetching the latest cart order.
      Map<String, dynamic> urlParameters = {
        'id': order.id,
      };

      Map<String, dynamic>? getresponse = await ApiService.post(
          endpoint: ApiEndpoints.getFoodOrder, body: urlParameters);

      order = FoodOrder.fromJson(getresponse!['order'] as Map<String, dynamic>);
      emit(UpdateFoodState(
          cartOrder: order,
          foodList: state.foodList,
          foodOrderList: state.foodOrderList));
      return status;
    } catch (e) {
      if (kDebugMode) {
        print('something went wrong while adding foodItemtoCart : $e');
      }
    }
    fetchFoodOrders();
    return status;
  }

  Future<void> fetchFoods() async {
    String? location = await LocalStorage.read(key: LocalStorageKeys.location);
    Map<String, dynamic> parameters = {"location": "$location"};
    await ApiService.get(
      endpoint: ApiEndpoints.getAllFoods,
      urlParameters: parameters,
    ).then((value) {
      if (value != null) {
        print(value);
        if (value['catalog']['status'] == 'Enter a valid location') {
          print('Enter a Location!!');
          emit(UpdateFoodState(
              foodList: [],
              cartOrder: state.cartOrder,
              foodOrderList: state.foodOrderList));
        } else {
          print(value);
          List<Food>? items = (value['catalog'] as List<dynamic>?)
              ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
              .toList();
          emit(UpdateFoodState(
              foodList: items,
              cartOrder: state.cartOrder,
              foodOrderList: state.foodOrderList));
        }
      }
    });
  }

  Future<bool> fetchFoodOrders() async {
    try {
      await ApiService.get(endpoint: ApiEndpoints.getAllFoodOrder)
          .then((value) {
        if (value != null) {
          List<FoodOrder> orders = (value as List<dynamic>).map((e) {
            return FoodOrder.fromJson(e as Map<String, dynamic>);
          }).toList();
          orders.removeWhere((element) => element.status == OrderStatus.hold);
          emit(UpdateFoodState(
              foodOrderList: orders,
              cartOrder: state.cartOrder,
              foodList: state.foodList));
          return true;
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }

  Future<void> fetchCartOrders() async {
    Map<String, dynamic> urlParameters = {
      'type': 'food',
      'status': '1',
      'search_by_user': '1'
    };
    try {
      Map<String, dynamic>? response = await ApiService.get(
          endpoint: ApiEndpoints.getOrderByType, urlParameters: urlParameters);
      if (response != null) {
        List<FoodOrder> orders = (response['orders'] as List<dynamic>).map((e) {
          return FoodOrder.fromJson(e as Map<String, dynamic>);
        }).toList();
        if (orders.isNotEmpty) {
          FoodOrder? cartOrder = orders.first;
          emit(UpdateFoodState(
              cartOrder: cartOrder,
              foodList: state.foodList,
              foodOrderList: state.foodOrderList));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('unable to fetch cart order $e');
      }
    }
  }

  Future<bool> removeFoodItemFromCart(int foodDetailsId) async {
    FoodOrder? order = state.cartOrder;

    if (order!.items
            .firstWhere((element) => element.foodDetailId == foodDetailsId)
            .quantity >
        0) {}
    Map<String, dynamic> body = {
      'order': {
        'id': order.id,
        'items': [
          {
            'id': foodDetailsId,
            'quantity': 1,
          }
        ]
      }
    };

    Map<String, dynamic>? response = await ApiService.post(
      endpoint: ApiEndpoints.removeFoodItem,
      body: body,
    );
    if (response != null) {
      if (response['status'] == 'success') {
        /// update the items offline
        return await fetchCartOrders().then((value) {
          return true;
        });
      }
    }
    return false;
  }
}
