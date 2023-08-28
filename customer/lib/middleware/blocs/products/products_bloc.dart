import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:customer/data/repositories/data.repository.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../data/models/apiresponse.dart';
import '../../../data/models/food.dart';
import '../../../data/models/rental.dart';
import '../../../data/models/ride.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final DataRepository dataRepository;
  ProductsBloc(this.dataRepository) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {});
    on<InitialProductFetchEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateProductState(
          foodList: response.foodItems,
          rideList: response.rideItems,
          rentalList: response.rentalItems));
    });
    on<UpdateFoodListEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateProductState(
        foodList: response.foodItems,
      ));
    });
    on<UpdateRideListEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateProductState(
        rideList: response.rideItems,
      ));
    });
    on<UpdateRentalListEvent>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateProductState(
        rentalList: response.rentalItems,
      ));
    });
  }
}
