import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/rental.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'accepted_rental_request_state.dart';

class AcceptedRentalRequestCubit extends Cubit<AcceptedRentalRequestState> {
  final Authrepository _authrepository;
  AcceptedRentalRequestCubit(this._authrepository)
      : super(AcceptedRentalRequestInitial());
  String path = "/service/get-order-by-type";

  void getAcceptedRequests() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(AcceptedRentalRequestLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.rental.name,
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
            emit(AcceptedRentalRequestError(message: error.toString())));
    if (response != null) {
      emit(AcceptedRentalRequestLoaded(
          rentalRequest: RentalRequestModal.fromJson(response)));
    }
  }
}
