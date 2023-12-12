import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/Constants/constants.dart';
import 'package:partner/helpers/models/ride.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'incoming_ride_request_state.dart';

class IncomingRideRequestCubit extends Cubit<IncomingRideRequestState> {
  final Authrepository _authrepository;
  IncomingRideRequestCubit(this._authrepository)
      : super(IncomingRideRequestInitial());

  String path = "/service/get-order-by-type";

  void getIncomingRequest() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(IncomingRideRequestLoading());
    Map<String, dynamic> parameters = {
      "type": RequestType.ride.name,
      "search_by_user": 0.toString(),
      "status": StatusRideRental.pending.code.toString()
    };
    print(parameters);

    var response = await getData(
            path: path,
            urlParameters: parameters,
            queryType: QueryType.get,
            headers: headers)
        .onError((error, stackTrace) =>
            emit(IncomingRideRequestError(message: error.toString())));

    if (response != null) {
      print(response);
      emit(IncomingRideRequestLoaded(
          rideRequest: RidesRequestModal.fromJson(response)));
    } else {}
  }

  void rejectRequest(String id) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    String path = "/service/set-status-ride/";
    Map<String, dynamic> body = {
      'ride_id': id,
      'status': StatusRideRental.rejected.code.toString()
    };

    await getData(
            path: path, queryType: QueryType.post, body: body, headers: headers)
        .then((value) =>
            getIncomingRequest())
        .onError(
          (error, stackTrace) => emit(
            IncomingRideRequestError(
              message: error.toString(),
            ),
          ),
        );
  }

  void acceptRequest(String id) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    String path = "/service/set-status-ride/";
    Map<String, dynamic> body = {
      'ride_id': id,
      'status': StatusRideRental.accepted.code.toString()
    };

    await getData(
            path: path, queryType: QueryType.post, body: body, headers: headers)
        .then((value) =>
            getIncomingRequest())
        .onError((error, stackTrace) =>
            emit(IncomingRideRequestError(message: error.toString())));
  }
}
