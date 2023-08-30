import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../data/models/apiresponse.dart';
import '../../../data/models/rental.dart';
import '../../../data/models/rentalrequest.dart';
import '../../../data/repositories/data.repository.dart';
import '../../../data/repositories/user.repository.dart';

part 'rental_event.dart';
part 'rental_state.dart';

class RentalBloc extends Bloc<RentalEvent, RentalState> {
  final UserRepository userRepository;
  final DataRepository dataRepository;
  RentalBloc(this.userRepository, this.dataRepository)
      : super(RentalInitial()) {
    on<RentalEvent>((event, emit) {});

    on<FetchRentals>((event, emit) async {
        String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateRentalState(
        rentalList: response.rentalItems,
      ));
    });
    on<FetchRentalRequests>((event, emit) async {
       String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateRentalState(
        rentalRequestList: response.rentalRequests,
      ));

    });

    on<CreateRentalRequest>((event, emit) => null);

  }
}
