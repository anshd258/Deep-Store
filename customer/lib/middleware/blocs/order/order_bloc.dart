import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../data/models/apiresponse.dart';
import '../../../data/models/foodorder.dart';
import '../../../data/models/rentalrequest.dart';
import '../../../data/models/riderequest.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) {});

    on<InitialOrderFetchEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 1000));

      /// simulating the data fetching from server.

      emit(UpdateOrderState(
        foodOrderList: response.foodOrders,
        rideRequestList: response.rideRequests,
        rentalRequestList: response.rentalRequests
      ));
    });
    on<UpdateFoodOrderEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 1000));

      /// simulating the data fetching from server.

      emit(UpdateOrderState(
        foodOrderList: response.foodOrders,
      ));
    });

    on<UpdateRideRequestEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 1000));

      /// simulating the data fetching from server.

      emit(UpdateOrderState(
        rentalRequestList: response.rentalRequests,
      ));
    });

    on<UpdateRentalRequestEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 1000));

      /// simulating the data fetching from server.

      emit(UpdateOrderState(rideRequestList: response.rideRequests));
    });
  }
}
