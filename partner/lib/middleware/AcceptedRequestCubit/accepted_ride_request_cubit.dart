import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/ride.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'accepted_ride_request_state.dart';

class AcceptedRideRequestCubit extends Cubit<AcceptedRideRequestState> {
  final Authrepository _authrepository;
  AcceptedRideRequestCubit(this._authrepository)
      : super(AcceptedRideRequestInitial());
  String path = "/service/get-order-by-type";

  void getAcceptedRequests() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(AcceptedRideRequestLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.ride.name,
      "search_by_user": 0.toString(),
      "status": StatusRideRental.accepted.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path,
            urlParameters: parameters,
            queryType: QueryType.get,
            headers: headers)
        .onError((error, stackTrace) =>
            emit(AcceptedRideRequestError(message: error.toString())));
    if (response != null) {
      emit(AcceptedRideRequestLoaded(
          rideRequest: RidesRequestModal.fromJson(response)));
    }
  }
}
