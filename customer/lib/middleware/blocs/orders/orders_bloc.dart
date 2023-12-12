import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import '../../../data/models/orders/foodorder.model.dart';
import '../../../data/models/orders/laundryrequest.model.dart';
import '../../../data/models/orders/orders.dart';
import '../../../data/models/orders/rentalrequest.model.dart';
import '../../../data/models/orders/taxirequest.model.dart';
part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(const OrdersInitial(null)) {
    on<OrdersEvent>((event, emit) {});

    on<GetOrders>((event, emit) async {
      Map<String, dynamic> jsondata = json.decode(
          await rootBundle.loadString('assets/dummydata/get_orders_datewise.json'));
      // Assuming jsonData is the provided JSON data
      Map<String, List<Order>> result = parseOrders(jsondata);

      // Print the result
      result.forEach((date, orders) {
        print('$date: $orders');
      });
      
      emit(OrdersUpdateState(result));
      
    });
  }


  Map<String, List<Order>> parseOrders(Map<String, dynamic> jsonData) {
    Map<String, List<Order>> ordersMap = {};

    (jsonData['service_orders'] as Map<String, dynamic>).forEach((date, ordersList) {
      List<Order> orders = [];
      for (var orderData in ordersList) {
        switch (orderData['type']) {
          case 'FOOD':
            orders.add(FoodOrder.fromJson(orderData));
            break;
          case 'RENTAL':
            orders.add(RentalOrder.fromJson(orderData));
            break;
          case 'TAXI':
            orders.add(TaxiOrder.fromJson(orderData));
            break;
          case 'LAUNDRY':
            orders.add(LaundryOrder.fromJson(orderData));
            break;
          default:
            // Handle unknown order types or ignore them
            break;
        }
      }
      ordersMap[date] = orders;
    });


    return ordersMap;
  }
}
