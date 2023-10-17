import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/rental.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'incoming_rental_request_state.dart';

class IncomingRentalRequestCubit extends Cubit<IncomingRentalRequestState> {
  final Authrepository _authrepository;
  IncomingRentalRequestCubit(this._authrepository)
      : super(IncomingRentalRequestInitial());

  String path = "/service/get-order-by-type";

  void getIncomingRequest() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(IncomingRentalRequestLoading());
    Map<String, dynamic> parameters = {
      "type": RequestType.rental.name,
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
            emit(IncomingRentalRequestError(message: error.toString())));

    if (response != null) {
      print(response);
      emit(IncomingRentalRequestCompleted(
          rentalRequest: RentalRequestModal.fromJson(response)));
    } else {}
  }

  void rejectRequest(
    String id,
  ) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    String path = "/service/set-status-rental/";
    Map<String, dynamic> body = {
      'rentalbooking_id': id,
      'status': StatusRideRental.rejected.code.toString()
    };

    await getData(
            path: path, queryType: QueryType.post, body: body, headers: headers)
        .then((value) =>
            getIncomingRequest())
        .onError((error, stackTrace) =>
            emit(IncomingRentalRequestError(message: error.toString())));
  }

  void acceptRequest(
    String id,
  ) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    String path = "/service/set-status-rental/";
    Map<String, dynamic> body = {
      'rentalbooking_id': id,
      'status': StatusRideRental.accepted.code.toString()
    };

    await getData(
            path: path, queryType: QueryType.post, body: body, headers: headers)
        .then((value) =>
            getIncomingRequest())
        .onError((error, stackTrace) =>
            emit(IncomingRentalRequestError(message: error.toString())));
  }
}
