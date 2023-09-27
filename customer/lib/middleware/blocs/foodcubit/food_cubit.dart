import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../data/datasource.dart';
import '../../../data/models/apiresponse.dart';
import '../../../data/models/food.dart';
import '../../../data/models/fooddetail.dart';
import '../../../data/models/foodorder.dart';
import '../../helpers/constants.dart';
import '../../helpers/shared_preferences_utils.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<bool> addItemToCart(
      Food food, int quantity, Map<String, int> selectedAddons) async {
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
    FoodDetails selectedItem =
        FoodDetails(food, selectedAddons, food.finalPrice, 1, 0);
    Map<String, dynamic> body = {
      'order': {
        'id': order!.id,
        'items': [
          {
            'id': selectedItem.food.foodID,
            'final_price': selectedItem.finalPrice,
            'options': selectedItem.selectedAddons,
            'quantity': selectedItem.quantity,
            'discount': selectedItem.discount
          }
        ],
      }
    };
    try {
      Response? response = await DataSource.get(
          path: DataSource.addFoodItem, queryType: QueryType.post, body: body);
      if (response != null) {
        print(response.body);
        status = json.decode(response.body)['status'] == 'success';

        /// fetching the latest cart order.
        Map<String, dynamic> urlParameters = {
          'id': (order.id).toString(),
        };
        ApiResponse? apiResponse = await DataSource.getData(
            path: DataSource.getFoodOrder, urlParameters: urlParameters);

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

  Future<void> fetchFoodOrders() async {
    try {
      await DataSource.getData(
          path: DataSource.getOrderByType,
          urlParameters: {'type': 'food', 'search_by_user': '1'}).then((value) {
        if (value != null) {
          emit(UpdateFoodState(
              foodOrderList: value.foodOrders,
              cartOrder: state.cartOrder,
              foodList: state.foodList));
        } else {}
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchCartOrders() async {
    Map<String, dynamic> urlParameters = {
      'type': 'food',
      'status': '1',
    };
    try {
      ApiResponse? apiResponse = await DataSource.getData(
          path: DataSource.getOrderByType, urlParameters: urlParameters);
      if (apiResponse!.foodOrders != null) {
        FoodOrder? cartOrder = apiResponse.foodOrders?.first;
        emit(UpdateFoodState(
            cartOrder: cartOrder,
            foodList: state.foodList,
            foodOrderList: state.foodOrderList));
      }
    } catch (e) {
      print('unable to fetch cart order $e');
    }
  }

  Future<bool> removeFoodItemFromCart(Food food) async {
    FoodOrder? order = state.cartOrder;

    if (order!.items
            .firstWhere((element) => element.food.foodID == food.foodID)
            .quantity >
        0) {}
    Map<String, dynamic> body = {
      'order': {
        'id': order.id,
        'items': [
          {
            'id': food.foodID,
            'quantity': 1,
          }
        ]
      }
    };

    Response? response = await DataSource.get(
      path: DataSource.removeFoodItem,
      queryType: QueryType.post,
      body: body,
    );
    if (response != null) {
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
