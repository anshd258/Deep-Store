import 'package:bloc/bloc.dart';
import 'package:customer/data/datasource.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/shared_preferences_utils.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../data/models/rental.dart';
import '../../../data/models/rentalrequest.dart';

part 'rental_state.dart';

class RentalCubit extends Cubit<RentalState> {
  RentalCubit() : super(RentalInitial());

  Future<void> fetchAllRentals() async {
    String? location = await SharedPreferencesUtils.getString(
        key: SharedPrefrencesKeys.location);
    Map<String, dynamic> parameters = {"location": "$location"};
    await DataSource.getData(
      path: DataSource.getAllRentals,
      urlParameters: parameters,
    ).then((value) {
      if (value != null) {
        emit(UpdateRentalState(
          rentalList: value.rentalItems,
        ));
      } else {}
    });
  }

  Future<void> fetchAllRentalRequests() async {
    try {
      await DataSource.getData(
        path: DataSource.getAllRentalRequests,
      ).then((value) {
        if (value != null) {
          emit(UpdateRentalState(
            rentalRequestList: value.rentalRequests,
          ));
        } else {}
      });
    } catch (e) {
      print('unable to fetch rental requests $e');
    }
  }

  Future<bool> createRentalRequest(String rentalId) async {
    String location = await SharedPreferencesUtils.getString(
            key: SharedPrefrencesKeys.location) ??
        '';

    Map<String, dynamic> body = {
      "rental_id": rentalId,
      "start_location": location,
      "end_location": 'mount abu',
      'start_coordinates': '123456',
      'end_coordinates': '78910'
    };
    try {
      http.Response? response = await DataSource.get(
        queryType: QueryType.post,
        path: DataSource.createRideRequest,
        body: body,
      );
      if (response!.statusCode == 200) return true;

      return false;
    } catch (e) {
      print('someting when wrong while requesting ride');
      return false;
    }
  }
}
