import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:customer/data/datasource.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

import '../../../data/models/rental.dart';
import '../../../data/models/rentalrequest.dart';
import '../../helpers/sharedprefrence.utils.dart';

part 'rental_state.dart';

class RentalCubit extends Cubit<RentalState> {
  RentalCubit() : super(RentalInitial());

  void clear() {
    emit(RentalInitial());
  }

  Future<void> fetchAllRentals() async {
    String? location = await SharedPreferencesUtils.getString(
        key: SharedPrefrencesKeys.location);
    Map<String, dynamic> parameters = {"location": "$location"};
    await DataSource.get(
      path: DataSource.getAllRentals,
      urlParameters: parameters,
    ).then((value) {
      if (value != null) {
        List<dynamic> jsondata = json.decode(value.body) ;
        List<Rental> rentals = jsondata.map((e) => Rental.fromJson(e)).toList();

        emit(UpdateRentalState(
          rentalList: rentals,
        ));
      } else {}
    });
  }

  Future<bool> fetchAllRentalRequests() async {
    try {
      await DataSource.getData(
        path: DataSource.getAllRentalRequests,
      ).then((value) {
        if (value != null) {
          emit(UpdateRentalState(
              rentalRequestList: value.rentalRequests,
              rentalList: state.rentalList));
          return true;
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        print('unable to fetch rental requests $e');
      }
    }
    return false;
  }

  Future<bool> createRentalRequest(String rentalId, int quantity) async {
    String location = await SharedPreferencesUtils.getString(
            key: SharedPrefrencesKeys.location) ??
        '';

    Map<String, dynamic> body = {
      "rental_id": rentalId,
      "start_location": location,
      "end_location": 'mount abu',
      'start_coordinates': '123456',
      'end_coordinates': '78910',
      'quantity':quantity,
      'start_time': DateTime.now().toString()
    };
    try {
      http.Response? response = await DataSource.get(
        queryType: QueryType.post,
        path: DataSource.createRentalRequest,
        body: body,
      );

      if (response!.statusCode == 200) {
        fetchAllRentalRequests();
        return true;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('someting went wrong while requesting ride');
      }
      return false;
    }
  }
}
