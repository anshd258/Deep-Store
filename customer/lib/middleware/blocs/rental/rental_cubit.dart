import 'package:bloc/bloc.dart';
import 'package:customer/data/apiservice.dart';
import 'package:customer/middleware/helpers/storage.utils.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../constants/apiendpoints.dart';
import '../../../constants/localstorage.keys.dart';
import '../../../data/models/rental.dart';
import '../../../data/models/rentalrequest.dart';

part 'rental_state.dart';

class RentalCubit extends Cubit<RentalState> {
  RentalCubit() : super(RentalInitial());

  void clear() {
    emit(RentalInitial());
  }

  Future<void> fetchAllRentals() async {
    String? location = await LocalStorage.read(key: LocalStorageKeys.location);
    Map<String, dynamic> parameters = {"location": "$location"};
    await ApiService.get(
      endpoint: ApiEndpoints.getAllRentals,
      urlParameters: parameters,
    ).then((value) {
      if (value != null) {
        print(value);
        var jsonData = value as List;
        List<Rental> rentals = jsonData.map((e) => Rental.fromJson(e)).toList();

        emit(UpdateRentalState(
          rentalList: rentals,
        ));
      } else {}
    });
  }

  Future<bool> fetchAllRentalRequests() async {
    try {
      await ApiService.get(
        endpoint: ApiEndpoints.getAllRentalRequests,
      ).then((value) {
        List<RentalRequest>? requests =
            (value!['rentalrequests'] as List<dynamic>?)
                ?.map((e) => RentalRequest.fromJson(e as Map<String, dynamic>))
                .toList();
        emit(UpdateRentalState(
            rentalRequestList: requests, rentalList: state.rentalList));
        return true;
      });
    } catch (e) {
      if (kDebugMode) {
        print('unable to fetch rental requests $e');
      }
    }
    return false;
  }

  Future<bool> createRentalRequest(String rentalId, int quantity) async {
    String location =
        await LocalStorage.read(key: LocalStorageKeys.location) ?? '';

    Map<String, dynamic> body = {
      "rental_id": rentalId,
      "start_location": location,
      "end_location": 'mount abu',
      'start_coordinates': '123456',
      'end_coordinates': '78910',
      'quantity': quantity,
      'start_time': DateTime.now().toString()
    };
    try {
      Map<String, dynamic>? response = await ApiService.post(
        endpoint: ApiEndpoints.createRentalRequest,
        body: body,
      );

      fetchAllRentalRequests();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('someting went wrong while requesting ride');
      }
      return false;
    }
  }
}
