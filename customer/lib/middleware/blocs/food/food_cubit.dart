import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../data/datasource.dart';
import '../../../data/models/apiresponse.dart';
import '../../../data/models/food.dart';
import '../../../data/models/foodorder.dart';
import '../../helpers/constants.dart';
import '../../helpers/sharedprefrence.utils.dart';

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
    Response? response = await DataSource.get(
        path: DataSource.updateFoodOrder,
        queryType: QueryType.post,
        body: body);
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

      ApiResponse? apiResponse = await DataSource.getData(
          path: DataSource.createFoodOrder, urlParameters: urlParameters);
      order = apiResponse!.foodOrder;
    }

    ///Adding selected addons to order.

    Map<String, dynamic> body = {
      'order': {
        'id': order!.id,
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
      Response? response = await DataSource.get(
          path: DataSource.addFoodItem, queryType: QueryType.post, body: body);
      if (response != null) {
        status = json.decode(response.body)['status'] == 'success';

        /// fetching the latest cart order.
        Map<String, dynamic> urlParameters = {
          'id': order.id,
        };
        print(urlParameters);

        Response? temp = await DataSource.get(
            queryType: QueryType.post,
            path: DataSource.getFoodOrder,
            body: urlParameters);
        print(json.decode(temp!.body));
        FoodOrder orderrr = FoodOrder.fromJson(
            json.decode(temp.body)['order'] as Map<String, dynamic>);
        print(orderrr);

        ApiResponse? apiResponse = await DataSource.getData(
            queryType: QueryType.post,
            path: DataSource.getFoodOrder,
            body: urlParameters);

        order = apiResponse!.foodOrder;
        emit(UpdateFoodState(
            cartOrder: order,
            foodList: state.foodList,
            foodOrderList: state.foodOrderList));
        return status;
      }
    } catch (e) {
      print('something went wrong while adding foodItemtoCart : $e');
    }
    fetchFoodOrders();
    return status;
  }

  Future<void> fetchFoods() async {
    String? location = await SharedPreferencesUtils.getString(
        key: SharedPrefrencesKeys.location);
    Map<String, dynamic> parameters = {"location": "$location"};
    await DataSource.getData(
      path: DataSource.getAllFoods,
      urlParameters: parameters,
    ).then((value) {
      if (value != null) {
        emit(UpdateFoodState(
            foodList: value.foodItems,
            cartOrder: state.cartOrder,
            foodOrderList: state.foodOrderList));
      } else {}
    });
  }

  Future<bool> fetchFoodOrders() async {
    try {
      await DataSource.get(
          path: DataSource.getOrderByType,
          urlParameters: {'type': 'food', 'search_by_user': '1'}).then((value) {
        if (value != null) {
          List<FoodOrder> orders =
              (json.decode(value.body)['orders'] as List<dynamic>).map((e) {
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
      print(e);
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
      Response? response = await DataSource.get(
          path: DataSource.getOrderByType, urlParameters: urlParameters);
      if (response != null) {
        List<FoodOrder> orders =
            (json.decode(response.body)['orders'] as List<dynamic>).map((e) {
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
      print('unable to fetch cart order $e');
    }
    print('cart updated');
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
    print(body);

    Response? response = await DataSource.get(
      path: DataSource.removeFoodItem,
      queryType: QueryType.post,
      body: body,
    );
    if (response != null) {
      print(json.decode(response.body)['status']);
      if (json.decode(response.body)['status'] == 'success') {
        /// update the items offline
        return await fetchCartOrders().then((value) {
          return true;
        });
      }
    }
    return false;
  }
}
