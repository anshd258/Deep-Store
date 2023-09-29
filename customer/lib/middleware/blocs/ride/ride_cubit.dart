import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../data/datasource.dart';
import '../../../data/models/ride.dart';
import '../../helpers/constants.dart';

part 'ride_state.dart';

class RideCubit extends Cubit<RideState> {
  RideCubit() : super(const RideInitial());

  Future<void> fetchRideRequests() async {
    await DataSource.getData(
      path: DataSource.getAllRideRequests,
    ).then((value) {
      if (value != null) {
        print(value.rideRequests!.length);
        emit(UpdateRideRequestsState(
          rideRequests: value.rideRequests,
        ));
      }
    });
  }

  Future<bool> createRideRequest(Ride ride) async {
    print('trying to create a ride request ');
    Map<String, dynamic> body = {
      "start_location": "Spsdfituk",
      "end_location": "Nubrsdfa",
      "start_coordinates": "123.23",
      "end_coordinates": "2323.3423",
      "price": 2000
    };
    // Map<String, dynamic> body = {
    //   "start_location": ride.pickUpLocation,
    //   "end_location": ride.dropOffLocation,
    //   "start_coordinates": ride.pickUpCoordinates,
    //   "end_coordinates": ride.dropOffCoordinates,
    //   "price": 2000
    // };
    try {
      Response? response = await DataSource.get(
        queryType: QueryType.post,
        path: DataSource.createRideRequest,
        body: body,
      );
      print(response!.statusCode);
      if (response != null) {
        print(json.decode(response.body));
        print('done requesting ride');
        return true;
      }
    } catch (e) {
      print('someting when wrong while requesting ride $e');
    }

    return false;
  }
}
