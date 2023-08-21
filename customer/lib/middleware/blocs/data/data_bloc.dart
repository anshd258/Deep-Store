import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:customer/middleware/models/apiresponse.dart';
import 'package:customer/middleware/models/food.dart';
import 'package:customer/middleware/models/foodorder.dart';
import 'package:customer/middleware/models/rental.dart';
import 'package:customer/middleware/models/rentalrequest.dart';
import 'package:customer/middleware/models/ride.dart';
import 'package:customer/middleware/models/riderequest.dart';
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
          ));
    });
  }
}
