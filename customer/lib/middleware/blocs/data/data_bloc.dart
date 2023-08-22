import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:customer/data/models/apiresponse.dart';
import 'package:customer/data/models/food.dart';
import 'package:customer/data/models/foodorder.dart';
import 'package:customer/data/models/rental.dart';
import 'package:customer/data/models/rentalrequest.dart';
import 'package:customer/data/models/ride.dart';
import 'package:customer/data/models/riderequest.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataEvent>((event, emit) {});

    on<UpdateDataEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 10));

      /// simulating the data fetching from server.

      emit(UpdateDataState(
          foodList: response.foodItems,
          rideList: response.rideItems,
          rentalList: response.rentalItems,
          foodOrderList: response.foodOrders,
          rentalRequestList: response.rentalRequests,
          rideRequestList: response.rideRequests));
    });
  }
}
