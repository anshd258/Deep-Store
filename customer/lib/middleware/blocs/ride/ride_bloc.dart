import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../data/models/apiresponse.dart';
import '../../../data/models/ride.dart';
import '../../../data/models/riderequest.dart';
import '../../../data/repositories/data.repository.dart';
import '../../../data/repositories/user.repository.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  final UserRepository userRepository;
  final DataRepository dataRepository;
  RideBloc(this.userRepository, this.dataRepository) : super(RideInitial()) {
    on<RideEvent>((event, emit) {});

    on<FetchRides>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateRideState(
        rideList: response.rideItems,
      ));
    });
    on<FetchRideRequests>((event, emit) async {
      String data = await rootBundle.loadString('assets/testdata.json');
      ApiResponse response = ApiResponse.fromJson(json.decode(data));
      await Future.delayed(const Duration(milliseconds: 100));

      emit(UpdateRideState(
        rideRequestList: response.rideRequests,
      ));
    });
    on<CreateRideRequest>((event, emit) => null);
  }
}
