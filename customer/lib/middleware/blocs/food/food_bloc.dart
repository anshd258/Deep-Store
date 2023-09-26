import 'package:bloc/bloc.dart';
import 'package:customer/data/models/food.dart';
import 'package:customer/data/models/foodorder.dart';
import 'package:customer/data/repositories/datasource.dart';
import 'package:customer/middleware/helpers/shared_preferences_utils.dart';
import 'package:meta/meta.dart';

import '../../../data/models/apiresponse.dart';
import '../../../data/models/fooddetail.dart';
import '../../helpers/constants.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<FoodEvent>((event, emit) {});

//////////////////////////////////////////////////////////////////////////////////////
    on<FetchFoods>((event, emit) async {
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
    });

//////////////////////////////////////////////////////////////////////////////////////
    on<FetchFoodOrders>((event, emit) async {
      await DataSource.getData(
        path: DataSource.getAllFoodOrder,
      ).then((value) {
        print('fetching food order complete');
        if (value != null) {
          emit(UpdateFoodState(
              foodOrderList: value.foodOrders,
              cartOrder: state.cartOrder,
              foodList: state.foodList));
        } else {}
      });
    });

//////////////////////////////////////////////////////////////////////////////////////
    on<FetchCartOrder>((event, emit) async {
      Map<String, dynamic> urlParameters = {
        'type': 'food',
        'status': '1',
      };
      try {
        ApiResponse? apiResponse = await DataSource.getData(
            path: DataSource.getOrderByType, urlParameters: urlParameters);
        if (apiResponse!.foodOrders != null) {
          FoodOrder? cartOrder = apiResponse.foodOrders?.first;
          emit(UpdateFoodState(cartOrder: cartOrder));
        }
      } catch (e) {
        print('unable to fetch cart order $e');
      }
    });

//////////////////////////////////////////////////////////////////////////////////////
    on<AddItemToCartEvent>((event, emit) async {
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
      Map<String, int> selectedAddons = event.selectedAddons;
      FoodDetails selectedItem =
          FoodDetails(event.food, selectedAddons, event.food.finalPrice, 1, 0);
      Map<String, dynamic> body = {
        'order': {
          'id': order!.id,
          'items': [
            {
              'id': selectedItem.food.foodID,
              'final_price': selectedItem.finalPrice,
              // 'options': null,
              'options': selectedItem.selectedAddons,
              'quantity': selectedItem.quantity,
              'discount': selectedItem.discount
            }
          ],
        }
      };
      try {
        await DataSource.getData(
            path: DataSource.addFoodItem,
            queryType: QueryType.post,
            body: body);
      } catch (e) {
        print('something went wrong while adding foodItemtoCart : $e');
      }

      /// fetching the latest cart order.
      Map<String, dynamic> urlParameters = {
        'order_id': (order.id).toString(),
      };
      ApiResponse? apiResponse = await DataSource.getData(
          path: DataSource.getFoodOrder, urlParameters: urlParameters);
      order = apiResponse!.foodOrder;
      emit(UpdateFoodState(
          cartOrder: order,
          foodList: state.foodList,
          foodOrderList: state.foodOrderList));
    });
  }
}
