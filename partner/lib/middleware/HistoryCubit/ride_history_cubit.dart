import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/ride.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'ride_history_state.dart';

class RideHistoryCubit extends Cubit<RideHistoryState> {
   final Authrepository _authrepository;
  RideHistoryCubit(this._authrepository) : super(RideHistoryInitial());
  String path = "/service/get-order-by-type";
  void getHistory() async {
      Map<String, String> headers = {
     'Content-Type': 'application/json',
  'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(RideHistoryLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.rental.name,
      "status": StatusRideRental.completed.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get, headers: headers)
        .onError((error, stackTrace) =>
            emit(RideHistoryError(message: error.toString())));
    if (response != null) {
      emit(
          RideHistoryLoaded(rideRequest:  RidesRequestModal.fromJson(response)));
    }
  }
}
